/*
  Warnings:

  - You are about to drop the column `level` on the `user_skills` table. All the data in the column will be lost.
  - You are about to drop the column `yearsOfExperience` on the `user_skills` table. All the data in the column will be lost.
  - You are about to drop the column `majorId` on the `users` table. All the data in the column will be lost.
  - Made the column `id_post` on table `reports` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id_comment` on table `reports` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "public"."users" DROP CONSTRAINT "users_majorId_fkey";

-- AlterTable
ALTER TABLE "public"."attachments" ALTER COLUMN "file_url" DROP NOT NULL,
ALTER COLUMN "file_name" DROP NOT NULL,
ALTER COLUMN "file_type" DROP NOT NULL,
ALTER COLUMN "file_size" DROP NOT NULL,
ALTER COLUMN "uploaded_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."bad_words" ALTER COLUMN "word" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "added_by" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."comments" ALTER COLUMN "content" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "updatedAt" DROP NOT NULL,
ALTER COLUMN "isDeleted" DROP NOT NULL,
ALTER COLUMN "status" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."follows" ALTER COLUMN "followedAt" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."majors" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."messages" ALTER COLUMN "sent_at" DROP NOT NULL,
ALTER COLUMN "is_deleted_by_sender" DROP NOT NULL,
ALTER COLUMN "is_deleted_by_receiver" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."notifications" ALTER COLUMN "type" DROP NOT NULL,
ALTER COLUMN "content" DROP NOT NULL,
ALTER COLUMN "is_read" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."posts" ALTER COLUMN "title" DROP NOT NULL,
ALTER COLUMN "content" DROP NOT NULL,
ALTER COLUMN "postType" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "updatedAt" DROP NOT NULL,
ALTER COLUMN "status" DROP NOT NULL,
ALTER COLUMN "viewCount" DROP NOT NULL,
ALTER COLUMN "isDeleted" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."reactions" ALTER COLUMN "reactionType" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."regions" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."reports" ALTER COLUMN "reason" DROP NOT NULL,
ALTER COLUMN "report_at" DROP NOT NULL,
ALTER COLUMN "status" DROP NOT NULL,
ALTER COLUMN "id_post" SET NOT NULL,
ALTER COLUMN "id_comment" SET NOT NULL;

-- AlterTable
ALTER TABLE "public"."roles" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "managePost" DROP NOT NULL,
ALTER COLUMN "manageUser" DROP NOT NULL,
ALTER COLUMN "canCreateNews" DROP NOT NULL,
ALTER COLUMN "canViewReports" DROP NOT NULL,
ALTER COLUMN "canManageTopicsTags" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."skills" ADD COLUMN     "category" VARCHAR(50),
ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."tags" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "id_user_created" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."topics" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "id_user_created" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."user_skills" DROP COLUMN "level",
DROP COLUMN "yearsOfExperience",
ADD COLUMN     "addedAt" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "note" VARCHAR(200),
ADD COLUMN     "proficiency" TEXT;

-- AlterTable
ALTER TABLE "public"."users" DROP COLUMN "majorId",
ALTER COLUMN "username" DROP NOT NULL,
ALTER COLUMN "password" DROP NOT NULL,
ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "profileVisibility" DROP NOT NULL,
ALTER COLUMN "isBanned" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL;

-- CreateTable
CREATE TABLE "public"."user_majors" (
    "userId" INTEGER NOT NULL,
    "majorId" INTEGER NOT NULL,
    "startDate" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMPTZ(6),
    "position" VARCHAR(100),
    "company" VARCHAR(100),
    "description" VARCHAR(500),

    CONSTRAINT "user_majors_pkey" PRIMARY KEY ("userId","majorId","startDate")
);

-- CreateIndex
CREATE INDEX "user_majors_userId_idx" ON "public"."user_majors"("userId");

-- CreateIndex
CREATE INDEX "user_majors_majorId_idx" ON "public"."user_majors"("majorId");

-- CreateIndex
CREATE INDEX "skills_category_idx" ON "public"."skills"("category");

-- CreateIndex
CREATE INDEX "user_skills_proficiency_idx" ON "public"."user_skills"("proficiency");

-- AddForeignKey
ALTER TABLE "public"."user_majors" ADD CONSTRAINT "user_majors_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."user_majors" ADD CONSTRAINT "user_majors_majorId_fkey" FOREIGN KEY ("majorId") REFERENCES "public"."majors"("id") ON DELETE CASCADE ON UPDATE CASCADE;

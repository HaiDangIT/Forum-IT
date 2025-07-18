/*
  Warnings:

  - The primary key for the `comments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `id_comment` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `id_post` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `is_deleted` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `parent_comment_id` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `comments` table. All the data in the column will be lost.
  - The primary key for the `follows` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `followed_at` on the `follows` table. All the data in the column will be lost.
  - You are about to drop the column `id_follower` on the `follows` table. All the data in the column will be lost.
  - You are about to drop the column `id_following` on the `follows` table. All the data in the column will be lost.
  - The `related_entity_type` column on the `notifications` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `posts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `id_post` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `is_deleted` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `moderated_at` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `moderated_by` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `original_author` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `original_published_date` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `post_type` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `source_url` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `view_count` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `word_count` on the `posts` table. All the data in the column will be lost.
  - The primary key for the `reactions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `reactions` table. All the data in the column will be lost.
  - You are about to drop the column `id_comment` on the `reactions` table. All the data in the column will be lost.
  - You are about to drop the column `id_post` on the `reactions` table. All the data in the column will be lost.
  - You are about to drop the column `id_reaction` on the `reactions` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `reactions` table. All the data in the column will be lost.
  - You are about to drop the column `reaction_type` on the `reactions` table. All the data in the column will be lost.
  - The primary key for the `roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_role` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the column `name_role` on the `roles` table. All the data in the column will be lost.
  - The primary key for the `skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `skills` table. All the data in the column will be lost.
  - You are about to drop the column `id_skill` on the `skills` table. All the data in the column will be lost.
  - The primary key for the `user_roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_role` on the `user_roles` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `user_roles` table. All the data in the column will be lost.
  - The primary key for the `user_skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_skill` on the `user_skills` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `user_skills` table. All the data in the column will be lost.
  - You are about to drop the column `level_skill` on the `user_skills` table. All the data in the column will be lost.
  - You are about to drop the column `years_of_experience` on the `user_skills` table. All the data in the column will be lost.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Avatar` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `Email` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `Gender` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `Password` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `Username` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `day_of_birth` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `is_banned` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `last_login_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `profile_visibility` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `region` on the `users` table. All the data in the column will be lost.
  - The `occupation` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `experience` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `role_claims` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId,postId]` on the table `reactions` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId,commentId]` on the table `reactions` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `roles` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[username]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `comments` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `postId` to the `comments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `comments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `comments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `followerId` to the `follows` table without a default value. This is not possible if the table is not empty.
  - Added the required column `followingId` to the `follows` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `type` on the `notifications` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `id` was added to the `posts` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `postType` to the `posts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `posts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `posts` table without a default value. This is not possible if the table is not empty.
  - The required column `id` was added to the `reactions` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `reactionType` to the `reactions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `reactions` table without a default value. This is not possible if the table is not empty.
  - The required column `id` was added to the `roles` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `name` to the `roles` table without a default value. This is not possible if the table is not empty.
  - The required column `id` was added to the `skills` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `name` on the `skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `roleId` to the `user_roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `user_roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `level` to the `user_skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skillId` to the `user_skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `user_skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `users` table without a default value. This is not possible if the table is not empty.
  - The required column `id` was added to the `users` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `password` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ExperienceLevel" AS ENUM ('FRESHER', 'JUNIOR', 'MIDDLE', 'SENIOR', 'LEAD', 'PRINCIPAL', 'MANAGER', 'DIRECTOR', 'VP_CTO');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('NEW_COMMENT_ON_POST', 'NEW_REACTION_ON_POST', 'NEW_REACTION_ON_COMMENT', 'NEW_FOLLOW', 'POST_MENTION', 'COMMENT_MENTION', 'REPORT_STATUS_UPDATE', 'ADMIN_MESSAGE');

-- CreateEnum
CREATE TYPE "NotificationEntityType" AS ENUM ('POST', 'COMMENT', 'USER', 'REPORT', 'MESSAGE');

-- DropForeignKey
ALTER TABLE "bad_words" DROP CONSTRAINT "bad_words_added_by_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_id_post_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_id_user_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_parent_comment_id_fkey";

-- DropForeignKey
ALTER TABLE "follows" DROP CONSTRAINT "follows_id_follower_fkey";

-- DropForeignKey
ALTER TABLE "follows" DROP CONSTRAINT "follows_id_following_fkey";

-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_id_receiver_fkey";

-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_id_sender_fkey";

-- DropForeignKey
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_id_user_fkey";

-- DropForeignKey
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_triggered_by_id_user_fkey";

-- DropForeignKey
ALTER TABLE "post_tags" DROP CONSTRAINT "post_tags_id_post_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_id_user_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_moderated_by_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_id_comment_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_id_post_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_id_user_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_comment_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_post_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_user_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_resolved_by_id_user_fkey";

-- DropForeignKey
ALTER TABLE "role_claims" DROP CONSTRAINT "role_claims_id_role_fkey";

-- DropForeignKey
ALTER TABLE "tags" DROP CONSTRAINT "tags_id_user_created_fkey";

-- DropForeignKey
ALTER TABLE "topics" DROP CONSTRAINT "topics_id_user_created_fkey";

-- DropForeignKey
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_id_role_fkey";

-- DropForeignKey
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_id_user_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_id_skill_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_id_user_fkey";

-- DropIndex
DROP INDEX "comments_created_at_idx";

-- DropIndex
DROP INDEX "comments_id_post_idx";

-- DropIndex
DROP INDEX "comments_id_user_idx";

-- DropIndex
DROP INDEX "comments_parent_comment_id_idx";

-- DropIndex
DROP INDEX "follows_id_follower_idx";

-- DropIndex
DROP INDEX "follows_id_following_idx";

-- DropIndex
DROP INDEX "posts_created_at_idx";

-- DropIndex
DROP INDEX "posts_id_user_idx";

-- DropIndex
DROP INDEX "posts_post_type_idx";

-- DropIndex
DROP INDEX "posts_view_count_idx";

-- DropIndex
DROP INDEX "reactions_id_comment_idx";

-- DropIndex
DROP INDEX "reactions_id_post_idx";

-- DropIndex
DROP INDEX "reactions_id_user_id_post_id_comment_key";

-- DropIndex
DROP INDEX "reactions_id_user_idx";

-- DropIndex
DROP INDEX "roles_name_role_key";

-- DropIndex
DROP INDEX "users_Email_idx";

-- DropIndex
DROP INDEX "users_Email_key";

-- DropIndex
DROP INDEX "users_Username_idx";

-- DropIndex
DROP INDEX "users_Username_key";

-- DropIndex
DROP INDEX "users_created_at_idx";

-- AlterTable
ALTER TABLE "comments" DROP CONSTRAINT "comments_pkey",
DROP COLUMN "created_at",
DROP COLUMN "id_comment",
DROP COLUMN "id_post",
DROP COLUMN "id_user",
DROP COLUMN "is_deleted",
DROP COLUMN "parent_comment_id",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "parentCommentId" TEXT,
ADD COLUMN     "postId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMPTZ(6) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "follows" DROP CONSTRAINT "follows_pkey",
DROP COLUMN "followed_at",
DROP COLUMN "id_follower",
DROP COLUMN "id_following",
ADD COLUMN     "followedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "followerId" TEXT NOT NULL,
ADD COLUMN     "followingId" TEXT NOT NULL,
ADD CONSTRAINT "follows_pkey" PRIMARY KEY ("followerId", "followingId");

-- AlterTable
ALTER TABLE "notifications" DROP COLUMN "type",
ADD COLUMN     "type" "NotificationType" NOT NULL,
DROP COLUMN "related_entity_type",
ADD COLUMN     "related_entity_type" "NotificationEntityType";

-- AlterTable
ALTER TABLE "posts" DROP CONSTRAINT "posts_pkey",
DROP COLUMN "created_at",
DROP COLUMN "deleted_at",
DROP COLUMN "id_post",
DROP COLUMN "id_user",
DROP COLUMN "is_deleted",
DROP COLUMN "moderated_at",
DROP COLUMN "moderated_by",
DROP COLUMN "original_author",
DROP COLUMN "original_published_date",
DROP COLUMN "post_type",
DROP COLUMN "source_url",
DROP COLUMN "updated_at",
DROP COLUMN "view_count",
DROP COLUMN "word_count",
ADD COLUMN     "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deletedAt" TIMESTAMPTZ(6),
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "moderatedAt" TIMESTAMPTZ(6),
ADD COLUMN     "moderatedById" TEXT,
ADD COLUMN     "originalAuthor" VARCHAR(100),
ADD COLUMN     "originalPublishedDate" TIMESTAMPTZ(6),
ADD COLUMN     "postType" "post_type" NOT NULL,
ADD COLUMN     "sourceUrl" VARCHAR(500),
ADD COLUMN     "updatedAt" TIMESTAMPTZ(6) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD COLUMN     "viewCount" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "wordCount" INTEGER,
ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_pkey",
DROP COLUMN "created_at",
DROP COLUMN "id_comment",
DROP COLUMN "id_post",
DROP COLUMN "id_reaction",
DROP COLUMN "id_user",
DROP COLUMN "reaction_type",
ADD COLUMN     "commentId" TEXT,
ADD COLUMN     "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "postId" TEXT,
ADD COLUMN     "reactionType" "reaction_type" NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD CONSTRAINT "reactions_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reports" ALTER COLUMN "id_comment" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "roles" DROP CONSTRAINT "roles_pkey",
DROP COLUMN "id_role",
DROP COLUMN "name_role",
ADD COLUMN     "canCreateNews" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManageTopicsTags" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canViewReports" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "managePost" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "manageUser" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "name" VARCHAR(50) NOT NULL,
ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "skills" DROP CONSTRAINT "skills_pkey",
DROP COLUMN "created_at",
DROP COLUMN "id_skill",
ADD COLUMN     "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "id" TEXT NOT NULL,
DROP COLUMN "name",
ADD COLUMN     "name" VARCHAR(100) NOT NULL,
ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_pkey",
DROP COLUMN "id_role",
DROP COLUMN "id_user",
ADD COLUMN     "roleId" TEXT NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD CONSTRAINT "user_roles_pkey" PRIMARY KEY ("roleId", "userId");

-- AlterTable
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_pkey",
DROP COLUMN "id_skill",
DROP COLUMN "id_user",
DROP COLUMN "level_skill",
DROP COLUMN "years_of_experience",
ADD COLUMN     "level" "ExperienceLevel" NOT NULL,
ADD COLUMN     "skillId" TEXT NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ADD COLUMN     "yearsOfExperience" SMALLINT,
ADD CONSTRAINT "user_skills_pkey" PRIMARY KEY ("userId", "skillId");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "Avatar",
DROP COLUMN "Email",
DROP COLUMN "Gender",
DROP COLUMN "Password",
DROP COLUMN "Username",
DROP COLUMN "created_at",
DROP COLUMN "day_of_birth",
DROP COLUMN "first_name",
DROP COLUMN "id_user",
DROP COLUMN "is_banned",
DROP COLUMN "last_login_at",
DROP COLUMN "last_name",
DROP COLUMN "profile_visibility",
DROP COLUMN "region",
ADD COLUMN     "avatar" VARCHAR(500),
ADD COLUMN     "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateOfBirth" DATE,
ADD COLUMN     "email" VARCHAR(255) NOT NULL,
ADD COLUMN     "firstName" VARCHAR(50),
ADD COLUMN     "gender" "gender",
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "isBanned" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "lastLoginAt" TIMESTAMPTZ(6),
ADD COLUMN     "lastName" VARCHAR(50),
ADD COLUMN     "password" VARCHAR(255) NOT NULL,
ADD COLUMN     "profileVisibility" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "regionId" TEXT,
ADD COLUMN     "username" VARCHAR(50) NOT NULL,
DROP COLUMN "occupation",
ADD COLUMN     "occupation" VARCHAR(100),
DROP COLUMN "experience",
ADD COLUMN     "experience" "ExperienceLevel",
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "role_claims";

-- DropEnum
DROP TYPE "experience_level";

-- DropEnum
DROP TYPE "it_major";

-- DropEnum
DROP TYPE "it_skill";

-- DropEnum
DROP TYPE "notification_entity_type";

-- DropEnum
DROP TYPE "notification_type";

-- DropEnum
DROP TYPE "vietnamese_region";

-- CreateTable
CREATE TABLE "regions" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(255),
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "regions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "regions_name_key" ON "regions"("name");

-- CreateIndex
CREATE INDEX "comments_postId_idx" ON "comments"("postId");

-- CreateIndex
CREATE INDEX "comments_userId_idx" ON "comments"("userId");

-- CreateIndex
CREATE INDEX "comments_parentCommentId_idx" ON "comments"("parentCommentId");

-- CreateIndex
CREATE INDEX "comments_createdAt_idx" ON "comments"("createdAt");

-- CreateIndex
CREATE INDEX "notifications_type_idx" ON "notifications"("type");

-- CreateIndex
CREATE INDEX "posts_userId_idx" ON "posts"("userId");

-- CreateIndex
CREATE INDEX "posts_postType_idx" ON "posts"("postType");

-- CreateIndex
CREATE INDEX "posts_createdAt_idx" ON "posts"("createdAt");

-- CreateIndex
CREATE INDEX "posts_viewCount_idx" ON "posts"("viewCount");

-- CreateIndex
CREATE UNIQUE INDEX "reactions_userId_postId_key" ON "reactions"("userId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "reactions_userId_commentId_key" ON "reactions"("userId", "commentId");

-- CreateIndex
CREATE UNIQUE INDEX "roles_name_key" ON "roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "skills_name_key" ON "skills"("name");

-- CreateIndex
CREATE INDEX "skills_name_idx" ON "skills"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_email_idx" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_username_idx" ON "users"("username");

-- CreateIndex
CREATE INDEX "users_createdAt_idx" ON "users"("createdAt");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "regions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "follows" ADD CONSTRAINT "follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "follows" ADD CONSTRAINT "follows_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_moderatedById_fkey" FOREIGN KEY ("moderatedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_parentCommentId_fkey" FOREIGN KEY ("parentCommentId") REFERENCES "comments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_id_post_fkey" FOREIGN KEY ("id_post") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_id_comment_fkey" FOREIGN KEY ("id_comment") REFERENCES "comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_resolved_by_id_user_fkey" FOREIGN KEY ("resolved_by_id_user") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_triggered_by_id_user_fkey" FOREIGN KEY ("triggered_by_id_user") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_id_sender_fkey" FOREIGN KEY ("id_sender") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_id_receiver_fkey" FOREIGN KEY ("id_receiver") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topics" ADD CONSTRAINT "topics_id_user_created_fkey" FOREIGN KEY ("id_user_created") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tags" ADD CONSTRAINT "tags_id_user_created_fkey" FOREIGN KEY ("id_user_created") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_id_post_fkey" FOREIGN KEY ("id_post") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bad_words" ADD CONSTRAINT "bad_words_added_by_fkey" FOREIGN KEY ("added_by") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

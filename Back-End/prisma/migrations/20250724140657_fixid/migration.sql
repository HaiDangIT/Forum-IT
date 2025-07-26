/*
  Warnings:

  - The primary key for the `attachments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_attachment` column on the `attachments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `bad_words` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_bad_word` column on the `bad_words` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `comments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `comments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `parentCommentId` column on the `comments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `follows` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `majors` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `majors` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `messages` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_message` column on the `messages` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `notifications` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_notification` column on the `notifications` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `related_entity_id` column on the `notifications` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `triggered_by_id_user` column on the `notifications` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `post_tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `posts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `posts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `moderatedById` column on the `posts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `reactions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `reactions` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `postId` column on the `reactions` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `commentId` column on the `reactions` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `regions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `regions` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `reports` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_report` column on the `reports` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `id_post` column on the `reports` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `id_comment` column on the `reports` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `resolved_by_id_user` column on the `reports` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `roles` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `skills` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_tag` column on the `tags` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `topic_tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `topics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id_topic` column on the `topics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `user_roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user_skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `regionId` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `majorId` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `id_message` on the `attachments` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `added_by` on the `bad_words` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `postId` on the `comments` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `comments` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `followerId` on the `follows` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `followingId` on the `follows` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_sender` on the `messages` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_receiver` on the `messages` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_user` on the `notifications` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_post` on the `post_tags` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_tag` on the `post_tags` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `posts` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `reactions` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_user` on the `reports` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_user_created` on the `tags` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_topic` on the `topic_tags` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_tag` on the `topic_tags` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_user_created` on the `topics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `roleId` on the `user_roles` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `user_roles` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `user_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `skillId` on the `user_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "attachments" DROP CONSTRAINT "attachments_id_message_fkey";

-- DropForeignKey
ALTER TABLE "bad_words" DROP CONSTRAINT "bad_words_added_by_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_parentCommentId_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_postId_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_userId_fkey";

-- DropForeignKey
ALTER TABLE "follows" DROP CONSTRAINT "follows_followerId_fkey";

-- DropForeignKey
ALTER TABLE "follows" DROP CONSTRAINT "follows_followingId_fkey";

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
ALTER TABLE "post_tags" DROP CONSTRAINT "post_tags_id_tag_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_moderatedById_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_userId_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_commentId_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_postId_fkey";

-- DropForeignKey
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_userId_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_comment_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_post_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_id_user_fkey";

-- DropForeignKey
ALTER TABLE "reports" DROP CONSTRAINT "reports_resolved_by_id_user_fkey";

-- DropForeignKey
ALTER TABLE "tags" DROP CONSTRAINT "tags_id_user_created_fkey";

-- DropForeignKey
ALTER TABLE "topic_tags" DROP CONSTRAINT "topic_tags_id_tag_fkey";

-- DropForeignKey
ALTER TABLE "topic_tags" DROP CONSTRAINT "topic_tags_id_topic_fkey";

-- DropForeignKey
ALTER TABLE "topics" DROP CONSTRAINT "topics_id_user_created_fkey";

-- DropForeignKey
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_roleId_fkey";

-- DropForeignKey
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_userId_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_skillId_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_userId_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_majorId_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_regionId_fkey";

-- AlterTable
ALTER TABLE "attachments" DROP CONSTRAINT "attachments_pkey",
DROP COLUMN "id_attachment",
ADD COLUMN     "id_attachment" SERIAL NOT NULL,
DROP COLUMN "id_message",
ADD COLUMN     "id_message" INTEGER NOT NULL,
ADD CONSTRAINT "attachments_pkey" PRIMARY KEY ("id_attachment");

-- AlterTable
ALTER TABLE "bad_words" DROP CONSTRAINT "bad_words_pkey",
DROP COLUMN "id_bad_word",
ADD COLUMN     "id_bad_word" SERIAL NOT NULL,
DROP COLUMN "added_by",
ADD COLUMN     "added_by" INTEGER NOT NULL,
ADD CONSTRAINT "bad_words_pkey" PRIMARY KEY ("id_bad_word");

-- AlterTable
ALTER TABLE "comments" DROP CONSTRAINT "comments_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "postId",
ADD COLUMN     "postId" INTEGER NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "parentCommentId",
ADD COLUMN     "parentCommentId" INTEGER,
ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "follows" DROP CONSTRAINT "follows_pkey",
DROP COLUMN "followerId",
ADD COLUMN     "followerId" INTEGER NOT NULL,
DROP COLUMN "followingId",
ADD COLUMN     "followingId" INTEGER NOT NULL,
ADD CONSTRAINT "follows_pkey" PRIMARY KEY ("followerId", "followingId");

-- AlterTable
ALTER TABLE "majors" DROP CONSTRAINT "majors_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "majors_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "messages" DROP CONSTRAINT "messages_pkey",
DROP COLUMN "id_message",
ADD COLUMN     "id_message" SERIAL NOT NULL,
DROP COLUMN "id_sender",
ADD COLUMN     "id_sender" INTEGER NOT NULL,
DROP COLUMN "id_receiver",
ADD COLUMN     "id_receiver" INTEGER NOT NULL,
ADD CONSTRAINT "messages_pkey" PRIMARY KEY ("id_message");

-- AlterTable
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_pkey",
DROP COLUMN "id_notification",
ADD COLUMN     "id_notification" SERIAL NOT NULL,
DROP COLUMN "id_user",
ADD COLUMN     "id_user" INTEGER NOT NULL,
DROP COLUMN "related_entity_id",
ADD COLUMN     "related_entity_id" INTEGER,
DROP COLUMN "triggered_by_id_user",
ADD COLUMN     "triggered_by_id_user" INTEGER,
ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id_notification");

-- AlterTable
ALTER TABLE "post_tags" DROP CONSTRAINT "post_tags_pkey",
DROP COLUMN "id_post",
ADD COLUMN     "id_post" INTEGER NOT NULL,
DROP COLUMN "id_tag",
ADD COLUMN     "id_tag" INTEGER NOT NULL,
ADD CONSTRAINT "post_tags_pkey" PRIMARY KEY ("id_post", "id_tag");

-- AlterTable
ALTER TABLE "posts" DROP CONSTRAINT "posts_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "moderatedById",
ADD COLUMN     "moderatedById" INTEGER,
ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reactions" DROP CONSTRAINT "reactions_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "postId",
ADD COLUMN     "postId" INTEGER,
DROP COLUMN "commentId",
ADD COLUMN     "commentId" INTEGER,
ADD CONSTRAINT "reactions_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "regions" DROP CONSTRAINT "regions_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "regions_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reports" DROP CONSTRAINT "reports_pkey",
DROP COLUMN "id_report",
ADD COLUMN     "id_report" SERIAL NOT NULL,
DROP COLUMN "id_user",
ADD COLUMN     "id_user" INTEGER NOT NULL,
DROP COLUMN "id_post",
ADD COLUMN     "id_post" INTEGER,
DROP COLUMN "id_comment",
ADD COLUMN     "id_comment" INTEGER,
DROP COLUMN "resolved_by_id_user",
ADD COLUMN     "resolved_by_id_user" INTEGER,
ADD CONSTRAINT "reports_pkey" PRIMARY KEY ("id_report");

-- AlterTable
ALTER TABLE "roles" DROP CONSTRAINT "roles_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "skills" DROP CONSTRAINT "skills_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "tags" DROP CONSTRAINT "tags_pkey",
DROP COLUMN "id_tag",
ADD COLUMN     "id_tag" SERIAL NOT NULL,
DROP COLUMN "id_user_created",
ADD COLUMN     "id_user_created" INTEGER NOT NULL,
ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("id_tag");

-- AlterTable
ALTER TABLE "topic_tags" DROP CONSTRAINT "topic_tags_pkey",
DROP COLUMN "id_topic",
ADD COLUMN     "id_topic" INTEGER NOT NULL,
DROP COLUMN "id_tag",
ADD COLUMN     "id_tag" INTEGER NOT NULL,
ADD CONSTRAINT "topic_tags_pkey" PRIMARY KEY ("id_topic", "id_tag");

-- AlterTable
ALTER TABLE "topics" DROP CONSTRAINT "topics_pkey",
DROP COLUMN "id_topic",
ADD COLUMN     "id_topic" SERIAL NOT NULL,
DROP COLUMN "id_user_created",
ADD COLUMN     "id_user_created" INTEGER NOT NULL,
ADD CONSTRAINT "topics_pkey" PRIMARY KEY ("id_topic");

-- AlterTable
ALTER TABLE "user_roles" DROP CONSTRAINT "user_roles_pkey",
DROP COLUMN "roleId",
ADD COLUMN     "roleId" INTEGER NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "user_roles_pkey" PRIMARY KEY ("roleId", "userId");

-- AlterTable
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_pkey",
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "skillId",
ADD COLUMN     "skillId" INTEGER NOT NULL,
ADD CONSTRAINT "user_skills_pkey" PRIMARY KEY ("userId", "skillId");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "regionId",
ADD COLUMN     "regionId" INTEGER,
DROP COLUMN "majorId",
ADD COLUMN     "majorId" INTEGER,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE INDEX "attachments_id_message_idx" ON "attachments"("id_message");

-- CreateIndex
CREATE INDEX "comments_postId_idx" ON "comments"("postId");

-- CreateIndex
CREATE INDEX "comments_userId_idx" ON "comments"("userId");

-- CreateIndex
CREATE INDEX "comments_parentCommentId_idx" ON "comments"("parentCommentId");

-- CreateIndex
CREATE INDEX "messages_id_sender_id_receiver_idx" ON "messages"("id_sender", "id_receiver");

-- CreateIndex
CREATE INDEX "notifications_id_user_idx" ON "notifications"("id_user");

-- CreateIndex
CREATE INDEX "posts_userId_idx" ON "posts"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "reactions_userId_postId_key" ON "reactions"("userId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "reactions_userId_commentId_key" ON "reactions"("userId", "commentId");

-- CreateIndex
CREATE INDEX "reports_id_user_idx" ON "reports"("id_user");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "regions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_majorId_fkey" FOREIGN KEY ("majorId") REFERENCES "majors"("id") ON DELETE SET NULL ON UPDATE CASCADE;

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
ALTER TABLE "attachments" ADD CONSTRAINT "attachments_id_message_fkey" FOREIGN KEY ("id_message") REFERENCES "messages"("id_message") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topics" ADD CONSTRAINT "topics_id_user_created_fkey" FOREIGN KEY ("id_user_created") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tags" ADD CONSTRAINT "tags_id_user_created_fkey" FOREIGN KEY ("id_user_created") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_id_post_fkey" FOREIGN KEY ("id_post") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_id_tag_fkey" FOREIGN KEY ("id_tag") REFERENCES "tags"("id_tag") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_tags" ADD CONSTRAINT "topic_tags_id_topic_fkey" FOREIGN KEY ("id_topic") REFERENCES "topics"("id_topic") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_tags" ADD CONSTRAINT "topic_tags_id_tag_fkey" FOREIGN KEY ("id_tag") REFERENCES "tags"("id_tag") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bad_words" ADD CONSTRAINT "bad_words_added_by_fkey" FOREIGN KEY ("added_by") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

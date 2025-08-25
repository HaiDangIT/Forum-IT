/*
  Warnings:

  - The values [LIKE,DISLIKE,LOVE,LAUGH] on the enum `reaction_type` will be removed. If these variants are still used in the database, this will fail.
  - Added the required column `updatedAt` to the `reactions` table without a default value. This is not possible if the table is not empty.
  - Made the column `reactionType` on table `reactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `createdAt` on table `reactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `reactions` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "public"."reaction_type_new" AS ENUM ('UPVOTE', 'DOWNVOTE');
ALTER TABLE "public"."reactions" ALTER COLUMN "reactionType" TYPE "public"."reaction_type_new" USING ("reactionType"::text::"public"."reaction_type_new");
ALTER TYPE "public"."reaction_type" RENAME TO "reaction_type_old";
ALTER TYPE "public"."reaction_type_new" RENAME TO "reaction_type";
DROP TYPE "public"."reaction_type_old";
COMMIT;

-- AlterTable
ALTER TABLE "public"."reactions" ADD COLUMN     "updatedAt" TIMESTAMPTZ(6) NOT NULL,
ALTER COLUMN "reactionType" SET NOT NULL,
ALTER COLUMN "createdAt" SET NOT NULL,
ALTER COLUMN "userId" SET NOT NULL;

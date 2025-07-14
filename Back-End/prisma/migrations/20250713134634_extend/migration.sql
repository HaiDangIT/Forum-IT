-- CreateTable
CREATE TABLE "User" (
    "idUser" SERIAL NOT NULL,
    "Username" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "FirstName" TEXT,
    "LastName" TEXT,
    "Gender" TEXT,
    "Avatar" TEXT,
    "DayOfBirth" TIMESTAMP(3),
    "Bio" TEXT,
    "Occupation" TEXT,
    "Experience" TEXT,
    "ProfileVisibility" BOOLEAN NOT NULL DEFAULT true,
    "is_banned" BOOLEAN NOT NULL DEFAULT false,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("idUser")
);

-- CreateTable
CREATE TABLE "Role" (
    "idRole" SERIAL NOT NULL,
    "NameRole" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("idRole")
);

-- CreateTable
CREATE TABLE "RoleClaim" (
    "idRole" INTEGER NOT NULL,
    "managepost" BOOLEAN NOT NULL DEFAULT false,
    "manageUser" BOOLEAN NOT NULL DEFAULT false,
    "can_create_news" BOOLEAN NOT NULL DEFAULT false,
    "can_view_reports" BOOLEAN NOT NULL DEFAULT false,
    "can_manage_topics_tags" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "RoleClaim_pkey" PRIMARY KEY ("idRole")
);

-- CreateTable
CREATE TABLE "UserRole" (
    "IdRole" INTEGER NOT NULL,
    "IdUser" INTEGER NOT NULL,

    CONSTRAINT "UserRole_pkey" PRIMARY KEY ("IdRole","IdUser")
);

-- CreateTable
CREATE TABLE "Skill" (
    "idSkill" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Description" TEXT,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("idSkill")
);

-- CreateTable
CREATE TABLE "UserSkill" (
    "idUser" INTEGER NOT NULL,
    "idSkill" INTEGER NOT NULL,
    "levelskill" TEXT,
    "YearsOfExperience" INTEGER,

    CONSTRAINT "UserSkill_pkey" PRIMARY KEY ("idUser","idSkill")
);

-- CreateTable
CREATE TABLE "Follow" (
    "idFollower" INTEGER NOT NULL,
    "idFollowing" INTEGER NOT NULL,
    "FollowedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Follow_pkey" PRIMARY KEY ("idFollower","idFollowing")
);

-- CreateTable
CREATE TABLE "Post" (
    "idPost" SERIAL NOT NULL,
    "idUser" INTEGER NOT NULL,
    "Title" TEXT NOT NULL,
    "Content" TEXT NOT NULL,
    "PostType" TEXT NOT NULL,
    "SourceURL" TEXT,
    "OriginalAuthor" TEXT,
    "OriginalPublishedDate" TIMESTAMP(3),
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,
    "Status" TEXT NOT NULL DEFAULT 'active',
    "viewcount" INTEGER NOT NULL DEFAULT 0,
    "moderated_by" INTEGER,
    "moderated_at" TIMESTAMP(3),
    "WordCount" INTEGER,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("idPost")
);

-- CreateTable
CREATE TABLE "Comment" (
    "idComment" SERIAL NOT NULL,
    "idPost" INTEGER NOT NULL,
    "idUser" INTEGER NOT NULL,
    "Content" TEXT NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,
    "ParentCommentId" INTEGER,
    "IsDeleted" BOOLEAN NOT NULL DEFAULT false,
    "Status" TEXT NOT NULL DEFAULT 'active',

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("idComment")
);

-- CreateTable
CREATE TABLE "Reaction" (
    "idReaction" SERIAL NOT NULL,
    "idUser" INTEGER NOT NULL,
    "idPost" INTEGER,
    "idComment" INTEGER,
    "ReactionType" TEXT NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Reaction_pkey" PRIMARY KEY ("idReaction")
);

-- CreateTable
CREATE TABLE "Report" (
    "idReport" SERIAL NOT NULL,
    "idUser" INTEGER NOT NULL,
    "idPost" INTEGER,
    "idComment" INTEGER,
    "Reason" TEXT NOT NULL,
    "ReportAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Status" TEXT NOT NULL DEFAULT 'pending',
    "ActionTaken" TEXT,
    "ResolvedByIdUser" INTEGER,
    "Resolved_at" TIMESTAMP(3),

    CONSTRAINT "Report_pkey" PRIMARY KEY ("idReport")
);

-- CreateTable
CREATE TABLE "Message" (
    "idMessage" SERIAL NOT NULL,
    "idSender" INTEGER NOT NULL,
    "idReceiver" INTEGER NOT NULL,
    "Content" TEXT NOT NULL,
    "SentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ReadAt" TIMESTAMP(3),
    "IsDeletedBySender" BOOLEAN NOT NULL DEFAULT false,
    "IsDeletedByReceiver" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("idMessage")
);

-- CreateTable
CREATE TABLE "Attachment" (
    "idAttachment" SERIAL NOT NULL,
    "IdMessage" INTEGER NOT NULL,
    "FileURL" TEXT NOT NULL,
    "FileName" TEXT NOT NULL,
    "FileType" TEXT NOT NULL,
    "FileSize" INTEGER NOT NULL,
    "UploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ThumbnailURL" TEXT,

    CONSTRAINT "Attachment_pkey" PRIMARY KEY ("idAttachment")
);

-- CreateTable
CREATE TABLE "Topic" (
    "idTopic" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "IdUserCreated" INTEGER NOT NULL,

    CONSTRAINT "Topic_pkey" PRIMARY KEY ("idTopic")
);

-- CreateTable
CREATE TABLE "Tag" (
    "idTag" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Description" TEXT,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "IdUserCreated" INTEGER NOT NULL,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("idTag")
);

-- CreateTable
CREATE TABLE "PostTag" (
    "idPost" INTEGER NOT NULL,
    "idTag" INTEGER NOT NULL,

    CONSTRAINT "PostTag_pkey" PRIMARY KEY ("idPost","idTag")
);

-- CreateTable
CREATE TABLE "TopicTag" (
    "idTopic" INTEGER NOT NULL,
    "idTag" INTEGER NOT NULL,

    CONSTRAINT "TopicTag_pkey" PRIMARY KEY ("idTopic","idTag")
);

-- CreateTable
CREATE TABLE "BadWord" (
    "idBadWord" SERIAL NOT NULL,
    "Word" TEXT NOT NULL,
    "AddedBy" INTEGER NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BadWord_pkey" PRIMARY KEY ("idBadWord")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_Username_key" ON "User"("Username");

-- CreateIndex
CREATE UNIQUE INDEX "User_Email_key" ON "User"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "Role_NameRole_key" ON "Role"("NameRole");

-- CreateIndex
CREATE UNIQUE INDEX "Skill_Name_key" ON "Skill"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Reaction_idUser_idPost_idComment_key" ON "Reaction"("idUser", "idPost", "idComment");

-- CreateIndex
CREATE UNIQUE INDEX "Topic_Name_key" ON "Topic"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_Name_key" ON "Tag"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "BadWord_Word_key" ON "BadWord"("Word");

-- AddForeignKey
ALTER TABLE "RoleClaim" ADD CONSTRAINT "RoleClaim_idRole_fkey" FOREIGN KEY ("idRole") REFERENCES "Role"("idRole") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_IdRole_fkey" FOREIGN KEY ("IdRole") REFERENCES "Role"("idRole") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_idSkill_fkey" FOREIGN KEY ("idSkill") REFERENCES "Skill"("idSkill") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Follow" ADD CONSTRAINT "Follow_idFollower_fkey" FOREIGN KEY ("idFollower") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Follow" ADD CONSTRAINT "Follow_idFollowing_fkey" FOREIGN KEY ("idFollowing") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_moderated_by_fkey" FOREIGN KEY ("moderated_by") REFERENCES "User"("idUser") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES "Post"("idPost") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_ParentCommentId_fkey" FOREIGN KEY ("ParentCommentId") REFERENCES "Comment"("idComment") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES "Post"("idPost") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_idComment_fkey" FOREIGN KEY ("idComment") REFERENCES "Comment"("idComment") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES "Post"("idPost") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_idComment_fkey" FOREIGN KEY ("idComment") REFERENCES "Comment"("idComment") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_ResolvedByIdUser_fkey" FOREIGN KEY ("ResolvedByIdUser") REFERENCES "User"("idUser") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_idSender_fkey" FOREIGN KEY ("idSender") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_idReceiver_fkey" FOREIGN KEY ("idReceiver") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attachment" ADD CONSTRAINT "Attachment_IdMessage_fkey" FOREIGN KEY ("IdMessage") REFERENCES "Message"("idMessage") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic" ADD CONSTRAINT "Topic_IdUserCreated_fkey" FOREIGN KEY ("IdUserCreated") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_IdUserCreated_fkey" FOREIGN KEY ("IdUserCreated") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostTag" ADD CONSTRAINT "PostTag_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES "Post"("idPost") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostTag" ADD CONSTRAINT "PostTag_idTag_fkey" FOREIGN KEY ("idTag") REFERENCES "Tag"("idTag") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TopicTag" ADD CONSTRAINT "TopicTag_idTopic_fkey" FOREIGN KEY ("idTopic") REFERENCES "Topic"("idTopic") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TopicTag" ADD CONSTRAINT "TopicTag_idTag_fkey" FOREIGN KEY ("idTag") REFERENCES "Tag"("idTag") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BadWord" ADD CONSTRAINT "BadWord_AddedBy_fkey" FOREIGN KEY ("AddedBy") REFERENCES "User"("idUser") ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE [dbo].[Table] (
    [ProductID]   INT            NOT NULL,
    [NameProduct] NVARCHAR (50)  NULL,
    [Price]       INT            NULL,
    [Status]        INT     NULL,
    [Amount]      INT            NULL,
    [Describe]    NVARCHAR (MAX) NULL,
    [Like]        INT            NULL,
    [MainImage]   NVARCHAR (50)  NULL,
    [Image1]      NVARCHAR (50)  NULL,
    [Image2]      NVARCHAR (50)  NULL,
    [Image3]      NVARCHAR (50)  NULL,
    [Image4]      NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);


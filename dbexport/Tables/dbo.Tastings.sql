SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Tastings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BottleId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
	[Notes] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[Tastings]  WITH CHECK ADD  CONSTRAINT [FK_Tastings_Bottles_BottleId] FOREIGN KEY([BottleId])
REFERENCES [dbo].[Bottles] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Tastings] CHECK CONSTRAINT [FK_Tastings_Bottles_BottleId]
ALTER TABLE [dbo].[Tastings]  WITH CHECK ADD  CONSTRAINT [FK_Tastings_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Tastings] CHECK CONSTRAINT [FK_Tastings_Customers_CustomerId]
CREATE NONCLUSTERED INDEX [IX_Tastings_BottleId] ON [dbo].[Tastings]
(
	[BottleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_Tastings_CustomerId] ON [dbo].[Tastings]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[Tastings] ADD  CONSTRAINT [PK_Tastings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

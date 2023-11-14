SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vw_TastingDetails]
AS (
   SELECT
        t.Id AS TastingId,
        CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
        t.Date AS DateTasted,
        d.Name AS DistilleryName,
        b.Name AS BottleName,
        b.Age AS BottleAge,
        t.Notes AS TastingNotes,
        t.Rating AS BottleRating
   FROM dbo.Tastings t
        JOIN dbo.Customers c ON c.Id = t.CustomerId
        JOIN dbo.Bottles b ON b.Id = t.BottleId
        JOIN dbo.Distilleries d ON d.Id = b.DistilleryId);


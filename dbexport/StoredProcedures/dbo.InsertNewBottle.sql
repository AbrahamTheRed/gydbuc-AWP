SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[InsertNewBottle]
   @BottleName NVARCHAR(100),
   @Age INT,
   @AlcoholByVolume REAL,
   @DistilleryName NVARCHAR(100)
AS
BEGIN
   DECLARE @DistilleryId INT;

   /* Determine DistilleryId by it's name*/
   SELECT @DistilleryId = d.Id
   FROM   dbo.Distilleries AS d
   WHERE  LOWER(d.Name) = LOWER(@DistilleryName);

   IF @DistilleryId IS NULL
   BEGIN
      INSERT dbo.Distilleries
      (
         Name
      )
      VALUES
      (
         @DistilleryName
      );

      SET @DistilleryId = SCOPE_IDENTITY();
   END;

   /* Insert the new bottle */
   INSERT dbo.Bottles
   (
      Name,
      DistilleryId,
      Age,
      AlcoholByVolume
   )
   VALUES
   (
      @BottleName,
      @DistilleryId,
      @Age,
      @AlcoholByVolume
   );

END;


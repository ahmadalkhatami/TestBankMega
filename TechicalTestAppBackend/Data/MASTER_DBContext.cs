using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TechicalTestAppBackend.Data
{
    public partial class MASTER_DBContext : DbContext
    {
        public MASTER_DBContext()
        {
        }

        public MASTER_DBContext(DbContextOptions<MASTER_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<MsLocationStorage> MsLocationStorages { get; set; } = null!;
        public virtual DbSet<MsUser> MsUsers { get; set; } = null!;
        public virtual DbSet<TrBpkb> TrBpkbs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Host=localhost;Database=MASTER_DB;Username=postgres;Password=7872238aA");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MsLocationStorage>(entity =>
            {
                entity.HasKey(e => e.LocationId)
                    .HasName("ms_location_storage_pkey");

                entity.ToTable("ms_location_storage");

                entity.Property(e => e.LocationId).HasColumnName("location_id");

                entity.Property(e => e.LocationName)
                    .HasMaxLength(255)
                    .HasColumnName("location_name");
            });

            modelBuilder.Entity<MsUser>(entity =>
            {
                entity.ToTable("ms_user");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.IsActive).HasColumnName("is_active");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasColumnName("password");

                entity.Property(e => e.UserName)
                    .HasMaxLength(255)
                    .HasColumnName("user_name");
            });

            modelBuilder.Entity<TrBpkb>(entity =>
            {
                entity.HasKey(e => e.AgreementNumber)
                    .HasName("tr_bpkb_pkey");

                entity.ToTable("tr_bpkb");

                entity.Property(e => e.AgreementNumber)
                    .HasMaxLength(100)
                    .HasColumnName("agreement_number");

                entity.Property(e => e.BpkbDate)
                    .HasColumnType("timestamp without time zone")
                    .HasColumnName("bpkb_date");

                entity.Property(e => e.BpkbDateIn)
                    .HasColumnType("timestamp without time zone")
                    .HasColumnName("bpkb_date_in");

                entity.Property(e => e.BpkbNo)
                    .HasMaxLength(100)
                    .HasColumnName("bpkb_no");

                entity.Property(e => e.BranchId)
                    .HasMaxLength(10)
                    .HasColumnName("branch_id");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(20)
                    .HasColumnName("created_by");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("timestamp without time zone")
                    .HasColumnName("created_on");

                entity.Property(e => e.FakturDate)
                    .HasColumnType("timestamp without time zone")
                    .HasColumnName("faktur_date");

                entity.Property(e => e.FakturNo)
                    .HasMaxLength(100)
                    .HasColumnName("faktur_no");

                entity.Property(e => e.LastUpdatedBy)
                    .HasMaxLength(20)
                    .HasColumnName("last_updated_by");

                entity.Property(e => e.LastUpdatedOn)
                    .HasColumnType("timestamp without time zone")
                    .HasColumnName("last_updated_on");

                entity.Property(e => e.LocationId).HasColumnName("location_id");

                entity.Property(e => e.PoliceNo)
                    .HasMaxLength(20)
                    .HasColumnName("police_no");

                entity.HasOne(d => d.Location)
                    .WithMany(p => p.TrBpkbs)
                    .HasForeignKey(d => d.LocationId)
                    .HasConstraintName("tr_bpkb_location_id_fkey");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

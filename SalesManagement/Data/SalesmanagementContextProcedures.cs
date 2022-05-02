﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SalesManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

namespace SalesManagement.Data
{
    public partial class SalesmanagementContext
    {
        private SalesmanagementContextProcedures _procedures;

        public virtual SalesmanagementContextProcedures Procedures
        {
            get
            {
                if (_procedures is null) _procedures = new SalesmanagementContextProcedures(this);
                return _procedures;
            }
            set
            {
                _procedures = value;
            }
        }

        public SalesmanagementContextProcedures GetProcedures()
        {
            return Procedures;
        }

        protected void OnModelCreatingGeneratedProcedures(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<signInResult>().HasNoKey().ToView(null);
            modelBuilder.Entity<StoreInvoicesResult>().HasNoKey().ToView(null);
            modelBuilder.Entity<StoreProductResult>().HasNoKey().ToView(null);
            modelBuilder.Entity<UserStoreResult>().HasNoKey().ToView(null);
        }
    }

    public interface ISalesmanagementContextProcedures
    {
        Task<List<signInResult>> signInAsync(string user_username, string user_password, bool? remember, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<List<StoreInvoicesResult>> StoreInvoicesAsync(int? store_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<List<StoreProductResult>> StoreProductAsync(int? store_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<List<UserStoreResult>> UserStoreAsync(int? user_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
    }

    public partial class SalesmanagementContextProcedures : ISalesmanagementContextProcedures
    {
        private readonly SalesmanagementContext _context;

        public SalesmanagementContextProcedures(SalesmanagementContext context)
        {
            _context = context;
        }

        public virtual async Task<List<signInResult>> signInAsync(string user_username, string user_password, bool? remember, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            var parameterreturnValue = new SqlParameter
            {
                ParameterName = "returnValue",
                Direction = System.Data.ParameterDirection.Output,
                SqlDbType = System.Data.SqlDbType.Int,
            };

            var sqlParameters = new []
            {
                new SqlParameter
                {
                    ParameterName = "user_username",
                    Size = 40,
                    Value = user_username ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.NVarChar,
                },
                new SqlParameter
                {
                    ParameterName = "user_password",
                    Size = 40,
                    Value = user_password ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.NVarChar,
                },
                new SqlParameter
                {
                    ParameterName = "remember",
                    Value = remember ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.Bit,
                },
                parameterreturnValue,
            };
            var _ = await _context.SqlQueryAsync<signInResult>("EXEC @returnValue = [dbo].[signIn] @user_username, @user_password, @remember", sqlParameters, cancellationToken);

            returnValue?.SetValue(parameterreturnValue.Value);

            return _;
        }

        public virtual async Task<List<StoreInvoicesResult>> StoreInvoicesAsync(int? store_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            var parameterreturnValue = new SqlParameter
            {
                ParameterName = "returnValue",
                Direction = System.Data.ParameterDirection.Output,
                SqlDbType = System.Data.SqlDbType.Int,
            };

            var sqlParameters = new []
            {
                new SqlParameter
                {
                    ParameterName = "store_id",
                    Value = store_id ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.Int,
                },
                parameterreturnValue,
            };
            var _ = await _context.SqlQueryAsync<StoreInvoicesResult>("EXEC @returnValue = [dbo].[StoreInvoices] @store_id", sqlParameters, cancellationToken);

            returnValue?.SetValue(parameterreturnValue.Value);

            return _;
        }

        public virtual async Task<List<StoreProductResult>> StoreProductAsync(int? store_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            var parameterreturnValue = new SqlParameter
            {
                ParameterName = "returnValue",
                Direction = System.Data.ParameterDirection.Output,
                SqlDbType = System.Data.SqlDbType.Int,
            };

            var sqlParameters = new []
            {
                new SqlParameter
                {
                    ParameterName = "store_id",
                    Value = store_id ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.Int,
                },
                parameterreturnValue,
            };
            var _ = await _context.SqlQueryAsync<StoreProductResult>("EXEC @returnValue = [dbo].[StoreProduct] @store_id", sqlParameters, cancellationToken);

            returnValue?.SetValue(parameterreturnValue.Value);

            return _;
        }

        public virtual async Task<List<UserStoreResult>> UserStoreAsync(int? user_id, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            var parameterreturnValue = new SqlParameter
            {
                ParameterName = "returnValue",
                Direction = System.Data.ParameterDirection.Output,
                SqlDbType = System.Data.SqlDbType.Int,
            };

            var sqlParameters = new []
            {
                new SqlParameter
                {
                    ParameterName = "user_id",
                    Value = user_id ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.Int,
                },
                parameterreturnValue,
            };
            var _ = await _context.SqlQueryAsync<UserStoreResult>("EXEC @returnValue = [dbo].[UserStore] @user_id", sqlParameters, cancellationToken);

            returnValue?.SetValue(parameterreturnValue.Value);

            return _;
        }
    }
}

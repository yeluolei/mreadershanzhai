﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MReader.Models
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="BookDB")]
	public partial class BookDBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertBuyer(Buyer instance);
    partial void UpdateBuyer(Buyer instance);
    partial void DeleteBuyer(Buyer instance);
    partial void InsertRemark(Remark instance);
    partial void UpdateRemark(Remark instance);
    partial void DeleteRemark(Remark instance);
    partial void InsertCatagoryLib(CatagoryLib instance);
    partial void UpdateCatagoryLib(CatagoryLib instance);
    partial void DeleteCatagoryLib(CatagoryLib instance);
    partial void InsertBook(Book instance);
    partial void UpdateBook(Book instance);
    partial void DeleteBook(Book instance);
    partial void InsertPopularBook(PopularBook instance);
    partial void UpdatePopularBook(PopularBook instance);
    partial void DeletePopularBook(PopularBook instance);
    #endregion
		
		public BookDBDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["BookDBConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public BookDBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public BookDBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public BookDBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public BookDBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Buyer> Buyers
		{
			get
			{
				return this.GetTable<Buyer>();
			}
		}
		
		public System.Data.Linq.Table<Remark> Remarks
		{
			get
			{
				return this.GetTable<Remark>();
			}
		}
		
		public System.Data.Linq.Table<CatagoryLib> CatagoryLibs
		{
			get
			{
				return this.GetTable<CatagoryLib>();
			}
		}
		
		public System.Data.Linq.Table<Book> Books
		{
			get
			{
				return this.GetTable<Book>();
			}
		}
		
		public System.Data.Linq.Table<PopularBook> PopularBooks
		{
			get
			{
				return this.GetTable<PopularBook>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Buyers")]
	public partial class Buyer : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _BuyID;
		
		private System.DateTime _BuyTime;
		
		private string _BuyUserName;
		
		private int _BookID;
		
		private EntityRef<Book> _Book;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnBuyIDChanging(int value);
    partial void OnBuyIDChanged();
    partial void OnBuyTimeChanging(System.DateTime value);
    partial void OnBuyTimeChanged();
    partial void OnBuyUserNameChanging(string value);
    partial void OnBuyUserNameChanged();
    partial void OnBookIDChanging(int value);
    partial void OnBookIDChanged();
    #endregion
		
		public Buyer()
		{
			this._Book = default(EntityRef<Book>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BuyID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int BuyID
		{
			get
			{
				return this._BuyID;
			}
			set
			{
				if ((this._BuyID != value))
				{
					this.OnBuyIDChanging(value);
					this.SendPropertyChanging();
					this._BuyID = value;
					this.SendPropertyChanged("BuyID");
					this.OnBuyIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BuyTime", DbType="DateTime NOT NULL")]
		public System.DateTime BuyTime
		{
			get
			{
				return this._BuyTime;
			}
			set
			{
				if ((this._BuyTime != value))
				{
					this.OnBuyTimeChanging(value);
					this.SendPropertyChanging();
					this._BuyTime = value;
					this.SendPropertyChanged("BuyTime");
					this.OnBuyTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BuyUserName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string BuyUserName
		{
			get
			{
				return this._BuyUserName;
			}
			set
			{
				if ((this._BuyUserName != value))
				{
					this.OnBuyUserNameChanging(value);
					this.SendPropertyChanging();
					this._BuyUserName = value;
					this.SendPropertyChanged("BuyUserName");
					this.OnBuyUserNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BookID", DbType="Int NOT NULL")]
		public int BookID
		{
			get
			{
				return this._BookID;
			}
			set
			{
				if ((this._BookID != value))
				{
					if (this._Book.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnBookIDChanging(value);
					this.SendPropertyChanging();
					this._BookID = value;
					this.SendPropertyChanged("BookID");
					this.OnBookIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_Buyer", Storage="_Book", ThisKey="BookID", OtherKey="ID", IsForeignKey=true)]
		public Book Book
		{
			get
			{
				return this._Book.Entity;
			}
			set
			{
				Book previousValue = this._Book.Entity;
				if (((previousValue != value) 
							|| (this._Book.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Book.Entity = null;
						previousValue.Buyers.Remove(this);
					}
					this._Book.Entity = value;
					if ((value != null))
					{
						value.Buyers.Add(this);
						this._BookID = value.ID;
					}
					else
					{
						this._BookID = default(int);
					}
					this.SendPropertyChanged("Book");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Remarks")]
	public partial class Remark : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _RemarkID;
		
		private int _BookID;
		
		private string _RemarkUserName;
		
		private System.DateTime _RemarkTime;
		
		private string _RemarkContent;
		
		private EntityRef<Book> _Book;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnRemarkIDChanging(int value);
    partial void OnRemarkIDChanged();
    partial void OnBookIDChanging(int value);
    partial void OnBookIDChanged();
    partial void OnRemarkUserNameChanging(string value);
    partial void OnRemarkUserNameChanged();
    partial void OnRemarkTimeChanging(System.DateTime value);
    partial void OnRemarkTimeChanged();
    partial void OnRemarkContentChanging(string value);
    partial void OnRemarkContentChanged();
    #endregion
		
		public Remark()
		{
			this._Book = default(EntityRef<Book>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RemarkID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int RemarkID
		{
			get
			{
				return this._RemarkID;
			}
			set
			{
				if ((this._RemarkID != value))
				{
					this.OnRemarkIDChanging(value);
					this.SendPropertyChanging();
					this._RemarkID = value;
					this.SendPropertyChanged("RemarkID");
					this.OnRemarkIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BookID", DbType="Int NOT NULL")]
		public int BookID
		{
			get
			{
				return this._BookID;
			}
			set
			{
				if ((this._BookID != value))
				{
					if (this._Book.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnBookIDChanging(value);
					this.SendPropertyChanging();
					this._BookID = value;
					this.SendPropertyChanged("BookID");
					this.OnBookIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RemarkUserName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string RemarkUserName
		{
			get
			{
				return this._RemarkUserName;
			}
			set
			{
				if ((this._RemarkUserName != value))
				{
					this.OnRemarkUserNameChanging(value);
					this.SendPropertyChanging();
					this._RemarkUserName = value;
					this.SendPropertyChanged("RemarkUserName");
					this.OnRemarkUserNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RemarkTime", DbType="DateTime NOT NULL")]
		public System.DateTime RemarkTime
		{
			get
			{
				return this._RemarkTime;
			}
			set
			{
				if ((this._RemarkTime != value))
				{
					this.OnRemarkTimeChanging(value);
					this.SendPropertyChanging();
					this._RemarkTime = value;
					this.SendPropertyChanged("RemarkTime");
					this.OnRemarkTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RemarkContent", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string RemarkContent
		{
			get
			{
				return this._RemarkContent;
			}
			set
			{
				if ((this._RemarkContent != value))
				{
					this.OnRemarkContentChanging(value);
					this.SendPropertyChanging();
					this._RemarkContent = value;
					this.SendPropertyChanged("RemarkContent");
					this.OnRemarkContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_Remark", Storage="_Book", ThisKey="BookID", OtherKey="ID", IsForeignKey=true)]
		public Book Book
		{
			get
			{
				return this._Book.Entity;
			}
			set
			{
				Book previousValue = this._Book.Entity;
				if (((previousValue != value) 
							|| (this._Book.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Book.Entity = null;
						previousValue.Remarks.Remove(this);
					}
					this._Book.Entity = value;
					if ((value != null))
					{
						value.Remarks.Add(this);
						this._BookID = value.ID;
					}
					else
					{
						this._BookID = default(int);
					}
					this.SendPropertyChanged("Book");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.CatagoryLib")]
	public partial class CatagoryLib : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _CatagoryName;
		
		private EntitySet<Book> _Books;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnCatagoryNameChanging(string value);
    partial void OnCatagoryNameChanged();
    #endregion
		
		public CatagoryLib()
		{
			this._Books = new EntitySet<Book>(new Action<Book>(this.attach_Books), new Action<Book>(this.detach_Books));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CatagoryName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string CatagoryName
		{
			get
			{
				return this._CatagoryName;
			}
			set
			{
				if ((this._CatagoryName != value))
				{
					this.OnCatagoryNameChanging(value);
					this.SendPropertyChanging();
					this._CatagoryName = value;
					this.SendPropertyChanged("CatagoryName");
					this.OnCatagoryNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="CatagoryLib_Book", Storage="_Books", ThisKey="ID", OtherKey="CategoryID")]
		public EntitySet<Book> Books
		{
			get
			{
				return this._Books;
			}
			set
			{
				this._Books.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Books(Book entity)
		{
			this.SendPropertyChanging();
			entity.CatagoryLib = this;
		}
		
		private void detach_Books(Book entity)
		{
			this.SendPropertyChanging();
			entity.CatagoryLib = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Books")]
	public partial class Book : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _ISBN;
		
		private string _Title;
		
		private decimal _Price;
		
		private System.DateTime _PublishDate;
		
		private string _Content;
		
		private string _Author;
		
		private int _TotalPages;
		
		private int _ID;
		
		private string _Publisher;
		
		private System.Guid _Guid;
		
		private string _Description;
		
		private int _TimesFavored;
		
		private int _TimesBought;
		
		private int _rate5;
		
		private int _rate4;
		
		private int _rate3;
		
		private int _rate2;
		
		private int _rate1;
		
		private int _CategoryID;
		
		private EntitySet<Buyer> _Buyers;
		
		private EntitySet<Remark> _Remarks;
		
		private EntitySet<PopularBook> _PopularBooks;
		
		private EntityRef<CatagoryLib> _CatagoryLib;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnISBNChanging(string value);
    partial void OnISBNChanged();
    partial void OnTitleChanging(string value);
    partial void OnTitleChanged();
    partial void OnPriceChanging(decimal value);
    partial void OnPriceChanged();
    partial void OnPublishDateChanging(System.DateTime value);
    partial void OnPublishDateChanged();
    partial void OnContentChanging(string value);
    partial void OnContentChanged();
    partial void OnAuthorChanging(string value);
    partial void OnAuthorChanged();
    partial void OnTotalPagesChanging(int value);
    partial void OnTotalPagesChanged();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnPublisherChanging(string value);
    partial void OnPublisherChanged();
    partial void OnGuidChanging(System.Guid value);
    partial void OnGuidChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnTimesFavoredChanging(int value);
    partial void OnTimesFavoredChanged();
    partial void OnTimesBoughtChanging(int value);
    partial void OnTimesBoughtChanged();
    partial void Onrate5Changing(int value);
    partial void Onrate5Changed();
    partial void Onrate4Changing(int value);
    partial void Onrate4Changed();
    partial void Onrate3Changing(int value);
    partial void Onrate3Changed();
    partial void Onrate2Changing(int value);
    partial void Onrate2Changed();
    partial void Onrate1Changing(int value);
    partial void Onrate1Changed();
    partial void OnCategoryIDChanging(int value);
    partial void OnCategoryIDChanged();
    #endregion
		
		public Book()
		{
			this._Buyers = new EntitySet<Buyer>(new Action<Buyer>(this.attach_Buyers), new Action<Buyer>(this.detach_Buyers));
			this._Remarks = new EntitySet<Remark>(new Action<Remark>(this.attach_Remarks), new Action<Remark>(this.detach_Remarks));
			this._PopularBooks = new EntitySet<PopularBook>(new Action<PopularBook>(this.attach_PopularBooks), new Action<PopularBook>(this.detach_PopularBooks));
			this._CatagoryLib = default(EntityRef<CatagoryLib>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ISBN", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string ISBN
		{
			get
			{
				return this._ISBN;
			}
			set
			{
				if ((this._ISBN != value))
				{
					this.OnISBNChanging(value);
					this.SendPropertyChanging();
					this._ISBN = value;
					this.SendPropertyChanged("ISBN");
					this.OnISBNChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Title", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Title
		{
			get
			{
				return this._Title;
			}
			set
			{
				if ((this._Title != value))
				{
					this.OnTitleChanging(value);
					this.SendPropertyChanging();
					this._Title = value;
					this.SendPropertyChanged("Title");
					this.OnTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="SmallMoney NOT NULL")]
		public decimal Price
		{
			get
			{
				return this._Price;
			}
			set
			{
				if ((this._Price != value))
				{
					this.OnPriceChanging(value);
					this.SendPropertyChanging();
					this._Price = value;
					this.SendPropertyChanged("Price");
					this.OnPriceChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PublishDate", DbType="DateTime NOT NULL")]
		public System.DateTime PublishDate
		{
			get
			{
				return this._PublishDate;
			}
			set
			{
				if ((this._PublishDate != value))
				{
					this.OnPublishDateChanging(value);
					this.SendPropertyChanging();
					this._PublishDate = value;
					this.SendPropertyChanged("PublishDate");
					this.OnPublishDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Content", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Content
		{
			get
			{
				return this._Content;
			}
			set
			{
				if ((this._Content != value))
				{
					this.OnContentChanging(value);
					this.SendPropertyChanging();
					this._Content = value;
					this.SendPropertyChanged("Content");
					this.OnContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Author", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Author
		{
			get
			{
				return this._Author;
			}
			set
			{
				if ((this._Author != value))
				{
					this.OnAuthorChanging(value);
					this.SendPropertyChanging();
					this._Author = value;
					this.SendPropertyChanged("Author");
					this.OnAuthorChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TotalPages", DbType="Int NOT NULL")]
		public int TotalPages
		{
			get
			{
				return this._TotalPages;
			}
			set
			{
				if ((this._TotalPages != value))
				{
					this.OnTotalPagesChanging(value);
					this.SendPropertyChanging();
					this._TotalPages = value;
					this.SendPropertyChanged("TotalPages");
					this.OnTotalPagesChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Publisher", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string Publisher
		{
			get
			{
				return this._Publisher;
			}
			set
			{
				if ((this._Publisher != value))
				{
					this.OnPublisherChanging(value);
					this.SendPropertyChanging();
					this._Publisher = value;
					this.SendPropertyChanged("Publisher");
					this.OnPublisherChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Guid", DbType="UniqueIdentifier NOT NULL")]
		public System.Guid Guid
		{
			get
			{
				return this._Guid;
			}
			set
			{
				if ((this._Guid != value))
				{
					this.OnGuidChanging(value);
					this.SendPropertyChanging();
					this._Guid = value;
					this.SendPropertyChanged("Guid");
					this.OnGuidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this.OnDescriptionChanging(value);
					this.SendPropertyChanging();
					this._Description = value;
					this.SendPropertyChanged("Description");
					this.OnDescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TimesFavored", DbType="Int NOT NULL")]
		public int TimesFavored
		{
			get
			{
				return this._TimesFavored;
			}
			set
			{
				if ((this._TimesFavored != value))
				{
					this.OnTimesFavoredChanging(value);
					this.SendPropertyChanging();
					this._TimesFavored = value;
					this.SendPropertyChanged("TimesFavored");
					this.OnTimesFavoredChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TimesBought", DbType="Int NOT NULL")]
		public int TimesBought
		{
			get
			{
				return this._TimesBought;
			}
			set
			{
				if ((this._TimesBought != value))
				{
					this.OnTimesBoughtChanging(value);
					this.SendPropertyChanging();
					this._TimesBought = value;
					this.SendPropertyChanged("TimesBought");
					this.OnTimesBoughtChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rate5", DbType="Int NOT NULL")]
		public int rate5
		{
			get
			{
				return this._rate5;
			}
			set
			{
				if ((this._rate5 != value))
				{
					this.Onrate5Changing(value);
					this.SendPropertyChanging();
					this._rate5 = value;
					this.SendPropertyChanged("rate5");
					this.Onrate5Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rate4", DbType="Int NOT NULL")]
		public int rate4
		{
			get
			{
				return this._rate4;
			}
			set
			{
				if ((this._rate4 != value))
				{
					this.Onrate4Changing(value);
					this.SendPropertyChanging();
					this._rate4 = value;
					this.SendPropertyChanged("rate4");
					this.Onrate4Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rate3", DbType="Int NOT NULL")]
		public int rate3
		{
			get
			{
				return this._rate3;
			}
			set
			{
				if ((this._rate3 != value))
				{
					this.Onrate3Changing(value);
					this.SendPropertyChanging();
					this._rate3 = value;
					this.SendPropertyChanged("rate3");
					this.Onrate3Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rate2", DbType="Int NOT NULL")]
		public int rate2
		{
			get
			{
				return this._rate2;
			}
			set
			{
				if ((this._rate2 != value))
				{
					this.Onrate2Changing(value);
					this.SendPropertyChanging();
					this._rate2 = value;
					this.SendPropertyChanged("rate2");
					this.Onrate2Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rate1", DbType="Int NOT NULL")]
		public int rate1
		{
			get
			{
				return this._rate1;
			}
			set
			{
				if ((this._rate1 != value))
				{
					this.Onrate1Changing(value);
					this.SendPropertyChanging();
					this._rate1 = value;
					this.SendPropertyChanged("rate1");
					this.Onrate1Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CategoryID", DbType="Int NOT NULL")]
		public int CategoryID
		{
			get
			{
				return this._CategoryID;
			}
			set
			{
				if ((this._CategoryID != value))
				{
					if (this._CatagoryLib.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnCategoryIDChanging(value);
					this.SendPropertyChanging();
					this._CategoryID = value;
					this.SendPropertyChanged("CategoryID");
					this.OnCategoryIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_Buyer", Storage="_Buyers", ThisKey="ID", OtherKey="BookID")]
		public EntitySet<Buyer> Buyers
		{
			get
			{
				return this._Buyers;
			}
			set
			{
				this._Buyers.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_Remark", Storage="_Remarks", ThisKey="ID", OtherKey="BookID")]
		public EntitySet<Remark> Remarks
		{
			get
			{
				return this._Remarks;
			}
			set
			{
				this._Remarks.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_PopularBook", Storage="_PopularBooks", ThisKey="ID", OtherKey="BookID")]
		public EntitySet<PopularBook> PopularBooks
		{
			get
			{
				return this._PopularBooks;
			}
			set
			{
				this._PopularBooks.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="CatagoryLib_Book", Storage="_CatagoryLib", ThisKey="CategoryID", OtherKey="ID", IsForeignKey=true)]
		public CatagoryLib CatagoryLib
		{
			get
			{
				return this._CatagoryLib.Entity;
			}
			set
			{
				CatagoryLib previousValue = this._CatagoryLib.Entity;
				if (((previousValue != value) 
							|| (this._CatagoryLib.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._CatagoryLib.Entity = null;
						previousValue.Books.Remove(this);
					}
					this._CatagoryLib.Entity = value;
					if ((value != null))
					{
						value.Books.Add(this);
						this._CategoryID = value.ID;
					}
					else
					{
						this._CategoryID = default(int);
					}
					this.SendPropertyChanged("CatagoryLib");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Buyers(Buyer entity)
		{
			this.SendPropertyChanging();
			entity.Book = this;
		}
		
		private void detach_Buyers(Buyer entity)
		{
			this.SendPropertyChanging();
			entity.Book = null;
		}
		
		private void attach_Remarks(Remark entity)
		{
			this.SendPropertyChanging();
			entity.Book = this;
		}
		
		private void detach_Remarks(Remark entity)
		{
			this.SendPropertyChanging();
			entity.Book = null;
		}
		
		private void attach_PopularBooks(PopularBook entity)
		{
			this.SendPropertyChanging();
			entity.Book = this;
		}
		
		private void detach_PopularBooks(PopularBook entity)
		{
			this.SendPropertyChanging();
			entity.Book = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.PopularBooks")]
	public partial class PopularBook : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private int _BookID;
		
		private EntityRef<Book> _Book;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnBookIDChanging(int value);
    partial void OnBookIDChanged();
    #endregion
		
		public PopularBook()
		{
			this._Book = default(EntityRef<Book>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BookID", DbType="Int NOT NULL")]
		public int BookID
		{
			get
			{
				return this._BookID;
			}
			set
			{
				if ((this._BookID != value))
				{
					if (this._Book.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnBookIDChanging(value);
					this.SendPropertyChanging();
					this._BookID = value;
					this.SendPropertyChanged("BookID");
					this.OnBookIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Book_PopularBook", Storage="_Book", ThisKey="BookID", OtherKey="ID", IsForeignKey=true)]
		public Book Book
		{
			get
			{
				return this._Book.Entity;
			}
			set
			{
				Book previousValue = this._Book.Entity;
				if (((previousValue != value) 
							|| (this._Book.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Book.Entity = null;
						previousValue.PopularBooks.Remove(this);
					}
					this._Book.Entity = value;
					if ((value != null))
					{
						value.PopularBooks.Add(this);
						this._BookID = value.ID;
					}
					else
					{
						this._BookID = default(int);
					}
					this.SendPropertyChanged("Book");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591

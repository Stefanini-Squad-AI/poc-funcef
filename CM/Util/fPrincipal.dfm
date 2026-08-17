object Form1: TForm1
  Left = 195
  Top = 164
  Width = 700
  Height = 380
  Caption = 'Save Data Packet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 692
    Height = 346
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Login'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object Label3: TLabel
        Left = 24
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Alias'
      end
      object EdtUsuario: TEdit
        Left = 64
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object EdtSenha: TEdit
        Left = 64
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EdtAlias: TEdit
        Left = 64
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Button1: TButton
        Left = 111
        Top = 113
        Width = 75
        Height = 25
        Caption = 'Conectar'
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Export Select'
      ImageIndex = 1
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 684
        Height = 13
        Align = alTop
        Caption = 'SQL'
      end
      object Label5: TLabel
        Left = 0
        Top = 102
        Width = 684
        Height = 13
        Align = alTop
        Caption = 'Resultado'
      end
      object Memo1: TMemo
        Left = 0
        Top = 13
        Width = 684
        Height = 89
        Align = alTop
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 115
        Width = 684
        Height = 167
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 282
        Width = 684
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Button2: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 0
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Open SQL'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Import Select'
      ImageIndex = 2
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 684
        Height = 13
        Align = alTop
        Caption = 'Resultado'
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 13
        Width = 684
        Height = 269
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 282
        Width = 684
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Button4: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Import'
          TabOrder = 0
        end
        object Button5: TButton
          Left = 0
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Load'
          TabOrder = 1
          OnClick = Button5Click
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 332
    Top = 224
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 476
    Top = 232
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 332
    Top = 168
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 476
    Top = 184
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 340
    Top = 120
  end
  object Query1: TQuery
    DatabaseName = 'DbSaveDataPacket'
    Left = 348
    Top = 80
  end
  object Database1: TDatabase
    DatabaseName = 'DbSaveDataPacket'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=ORA_SERVER'
      'USER NAME=CM'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 340
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'cds'
    Filter = 'Data Packet|*.cds'
    Left = 180
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'cds'
    Filter = 'Data Packet|*.cds'
    Left = 260
    Top = 280
  end
end

object frmLiberaVersao: TfrmLiberaVersao
  Left = 96
  Top = 61
  Width = 558
  Height = 492
  Caption = 'Libera nova versão de módulo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 428
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object flArq: TFileListBox
      Left = 195
      Top = 240
      Width = 226
      Height = 97
      ItemHeight = 13
      TabOrder = 0
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 4
      Top = 59
      Width = 542
      Height = 365
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Alterações Efetuadas Na Versão'
        object reAlteraVer: TRichEdit
          Left = 0
          Top = 0
          Width = 534
          Height = 337
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pendências Para Módulo'
        object Splitter1: TSplitter
          Left = 0
          Top = 238
          Width = 534
          Height = 3
          Cursor = crVSplit
          Align = alBottom
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 238
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object dbgPendencias: TwwDBGrid
            Left = 0
            Top = 26
            Width = 534
            Height = 212
            Selected.Strings = (
              'FLGTERMINADO'#9'4'#9'OK'
              'IDPENDENCIA'#9'6'#9'Código'
              'DATAINICIOPREV'#9'14'#9'Data Início'
              'DATATERMINOPREV'#9'14'#9'Término'
              'PRAZOHORAS'#9'6'#9'Prazo'
              'TELAModulo'#9'30'#9'Tela'
              'RESUMODESC'#9'40'#9'Descrição')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsListaPendencias
            KeyOptions = []
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 534
            Height = 26
            Align = alTop
            Caption = 'Relação da Pendências'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 241
          Width = 534
          Height = 96
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 1
          object DBMemo1: TDBMemo
            Left = 0
            Top = 26
            Width = 534
            Height = 70
            Align = alClient
            DataField = 'DESCHISTPENDENCIA'
            DataSource = dsListaPendencias
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 534
            Height = 26
            Align = alTop
            Caption = 'Descrição da Pendência'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Histórico'
        object reAlteraExiste: TRichEdit
          Left = 0
          Top = 0
          Width = 534
          Height = 337
          Align = alClient
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          PlainText = True
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
    end
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 542
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 7
        Width = 42
        Height = 13
        Caption = 'Módulo'
      end
      object Label2: TLabel
        Left = 258
        Top = 7
        Width = 72
        Height = 13
        Caption = 'Versão atual'
      end
      object Label4: TLabel
        Left = 401
        Top = 14
        Width = 11
        Height = 37
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 447
        Top = 14
        Width = 11
        Height = 37
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 365
        Top = 7
        Width = 90
        Height = 13
        Caption = 'Liberar versão :'
      end
      object SpeedButton1: TSpeedButton
        Left = 216
        Top = 24
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object edAtual: TEdit
        Left = 258
        Top = 24
        Width = 79
        Height = 21
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object edV1: TSpinEdit
        Tag = 1
        Left = 365
        Top = 24
        Width = 37
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = edV1Change
      end
      object edV2: TSpinEdit
        Tag = 2
        Left = 411
        Top = 24
        Width = 37
        Height = 22
        AutoSize = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = edV1Change
      end
      object edV3: TSpinEdit
        Tag = 3
        Left = 455
        Top = 24
        Width = 37
        Height = 22
        AutoSize = False
        MaxValue = 1000
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = edV1Change
      end
      object edRelease: TMaskEdit
        Left = 495
        Top = 24
        Width = 21
        Height = 21
        EditMask = '<l;0; '
        MaxLength = 1
        TabOrder = 4
        OnChange = edV1Change
      end
      object EdtModulo: TEdit
        Left = 16
        Top = 24
        Width = 198
        Height = 21
        Color = clGray
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  object CMOkCancelar: TCMOkCancelar
    Left = 0
    Top = 428
    Width = 550
    Height = 37
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888888888888787878888888888888788887888888888888888088F8FF8FFFF8
      88F88F88F8F8F8F8F8F8F8F8F888888888887888788888888888888888888888
      888888888887878878888888888888888878888888888888888888888FFFFF8F
      8F8F88F8F8F8F8F8F8F8F8F88888888888888878788888888888888888888888
      88888888888888787888888888888888878888888888888888888888888FF8FF
      8F88888888F8F8FF8F8F88F88F88888888888888788888888888888888888888
      8888888888887887888888888888888887888888888888888888888888888FFF
      FF8F8888F8F8F8F8F8F88F888888888888888887878888888888888888888888
      888888888888887888888888888888888888888888888888888888888888888F
      F8F8F8F888F8F8F8F8F8F8F8F888888888888888788888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      FFFF8F8F8F8F8F8F8F8F888888888F8888888888888888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      8FF8F8F8F8F8F8FFFFF8F8F8F8F8888888888888878878788888888888888888
      8888888888888888888888888888888888888888888888888888888888888887
      88FFFFF8F8888F88F8F8F88F88888F8888888888888787888888888888888888
      8888888888888788888888888888888888888888888888888888888888888888
      888FFFFFF8F8F88F8F8FF8F8F88F888888888888888888788888888888888888
      8888888888888888887888888888888888888888888888888888888888888888
      8788FFFF8F8F88F8F8FF8FF8F8F8F88F88888888888787878888888888888888
      8888888888888878887888888888888888888888888888888888888888888888
      88888FFFFF8F8888F8F8FF8FF8F88F8888888888888888888888887888888888
      8888888888888887888888888888888888888888888888888888888888888888
      888888FFFF8F88F8F8F8F8F8F8F8F88F8F888888888887878887888788788888
      8888888888888888888888888888888888888888888888888888888888888888
      888888FFFFFF8F88F8F8F8FF8FF8F8F8888F8888888888887878878888888888
      8888888888888888788888888888888888888888888888888888888888888888
      8888888FFFF8F8F888F8F8F8F8F8F888F8888F88888888878887888888888888
      8888888888888888878888888888888888888888888888888888888888888888
      8888888F8FFF8F88F8F88F8FFF8F8F8F888F8888888888787878878888888F88
      8888888888888888888887888888888888888888888888888888888888888888
      8888888FFFF8F8888888F8F8F8F8F8F88F88F8888888888887887888888F8888
      F8F8888888888888887888888888788888888888888888888888888888888888
      88888788FFFFF8F888F88F8F8FF8F8F8F88F88F888888888787878788888F888
      888F8F8888888888888788788887878888888888888888888888888888888888
      88888888FFFF8F888888F8F8FF8F8F8F8F8F8F88888888888887878878888888
      88888F8F88888888888878887888888888888888888888888888888888888888
      888888788FFFF8F8F88F8F8FF8F8FF8F8F8F8F8F888888888878788788888888
      7888888888888888888887878878888788888888888888888888888888888888
      888888888FFFF8F88888888F8F8FF8F8F8F8F888F88888888887887878888887
      8888888888887888888888788887888888888888888888888888888888888888
      88888887888F8F8F88888F8F8F8F8F8F8F8F8F8F888888888888887878878878
      8888888888888888888887888888888888888888888888888888888888888888
      888888888888F8F8F8F88F8F8F8F8F8F8F8F8888888F88888888878878787878
      8888888888787888888878888888888888888888888888888888888888888888
      88888888888888F8F88888888F8F8F8F8F8F8F8F8F8888888888888888878888
      8888888888888788888887888888888888888888888888888888888888888888
      888888888888888F8F88888F8F8F8F8F8F8F8F888888F88F8888887888878888
      8888888888888888888887788888888888888888888888888888888888888888
      8788888888888888F8F8888888F88F8F8FF8F8F8F8F888888888888888878888
      8888888888888888888888888888888888888888888888888888888888888888
      8888888888888888888888888F88F8F8F8F8F8F88888F8888888888887888888
      8888888888888888888887878888888888888888888888888888888888888888
      888888788888887888888888888F8F8F8F8F8F8F8F8F888F8888888888878888
      8888888888888888888888787888888888888888888888888888888888888888
      87888888888888888888888888F8F8F8F8F8F8F8F8F88F888888888888788888
      8888888888888888888888788888888888888888888888888888888888888878
      88888888888888878888888888888F88F8F8F8F8F8F8F8888888888888888888
      88888888888888888888888888888888888F8888888888888888888888888787
      8787888888888888787888888888F88F8F8F8F8F8F8F8F888888888888888888
      887888888888888888888888888888888788F888888888888888888888888878
      787888788888888878887888888888F8F8F8F8FF8F8F88F88888888888888787
      8888888888888888888888888888888888888F88888888888888888888888888
      88878788888888888787878788888F88F8F8F8F8F8F8F88F8888888888888787
      8788888788888888888888888888888888888FF8F88887888888888888888888
      7878888888888888887888888888888F8F8F8F8F8F8F88F8F888888888888888
      8888888878888888888888888888888888888888888888888888888888888888
      878888888888888888888888878888F88F8F8F8F8F8F8F8F88F8888888888887
      8788888888888888888888888888888888887888888888888888888888888888
      88788888888888888888888888888888F8F88F8F8F8F8F8FF888F88888888878
      888888F888888888888888888888888888888888878788878888888888888888
      88788888888888888888888887888888888F88F8F8F8F8F888F8888888888888
      787888F8F8888888888888788888888888888888888888888888888888888888
      888888888888888888888888788788888F88F8F8F8F8F8F8F8F8F8F888888888
      8888888F88888888888888888888888888888888888888888888888888888888
      88888888888888888888888887888888888F88F8F8F8F8F8F8F88888F8888888
      8878888F88888888888888878788888888888888888888888888888888888888
      8888888888888888888888888878888888888F8F8F8F8F8F8888F8F888888888
      888888888F888888888888888878888888888888888888888888888888888888
      888888888888888888888888888888888888F8F8F8F8F8F8F8F8F88888888888
      8888888888888888888888887888888888888888888888888888888888888888
      88888888888888888888888888878887888888F8F88F8F8F8F8F88F888888888
      8888888888888888888888888878788888888887888888888888888888888888
      8888888888888888888888888888788888888F8F88F8F8F8F8F88F888F888888
      8888888888888788888888888888888888888878788888888888888888888888
      88888888888888888788888888878787888888888F8F8FF8F8F8F88F88888888
      8888888888878888888888888878788888888888888888888888888888888888
      888888888888888888788888888877878888888F8F8F8F8F8F88F8F8F8F88888
      888888888878787878888888888888888888888887888888888F888888888888
      888888888888888888888888888778778888888888F88F8F8F8F88F88888F888
      88888888787888888888888888888888888888888888888888F8F88888888888
      88888888888888888887888888887778788888888F88F8F8F888F8F8F8F88888
      8888888888787888888888888888888888888888888888888888888888888888
      888888888888888888888888888887888888888888F88F8F8F8F8F8F888F8888
      8888888878788888888888888888888888888888888888888888888888888888
      88888888888888888888888888888888888788888888F88F8F88F8F8F8F88F88
      8888888888787888888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888788888888F8F8F8F8F8F8F888F8888
      88888888888888888F8F88888878888888888888888888888888888887888888
      8888888888888888888888888888888888878888888888F8F8F88F8F8F8F88F8
      88888888888888888F8F8F888888888888888888888888888888887888888888
      88888888788888888888888888887888888878888888F8F8F88F8F8F8F88F888
      888888888888888888FFF88F8888878888888888888888888888888888788888
      88888888888888888888888888887888888887888888888888F8F8F8F88F88F8
      88F8888888888888888888F88888888888888888888888888888888888888888
      88888888888888888888888888888888888888787888888F8F88F8F8F8F88F88
      F88888888888888888888888F8F8888888888888888888888888888888888888
      888888888878888888888888888888888888878888888888888F8F8F8F88F88F
      88F88888888F88888878888888F8888888888888888888888888888888888888
      88888888888788888888888888888888888888888788888888F8F8F88F8F88F8
      8F88F88888888F88888878888888888888888888888888888888888888888888
      8888888888887888888888888888888888888888888888888F88F8F8F888F888
      F88F888888888888887887888888887888888888888888888888888888888888
      888888888888888887888888888888888888888888788888888F8F8F8F8F88F8
      F8F8888888888888888878787888888888888888888888888888888888888888
      88888888888887888888888888888788888888888887888888888888F888F888
      8888888888888888888787878788887888888888888888888888888888888888
      88888888888888888888888888888888888888888888888888888F8F8F8F8888
      F88F88F888888888888887887878788888888888888888888888888888888888
      8888888888888888888888888888888888888888888788888888}
    OnOkClick = CMOkCancelarOkClick
    Buttons.BtnOk.Visible = True
    Buttons.BtnOk.Caption = '&Ok'
    Buttons.BtnOk.Enabled = True
    Buttons.BtnOk.Tag = 0
    Buttons.BtnOk.ShowHint = False
    Buttons.BtnOk.Default = True
    Buttons.BtnOk.Cancel = False
    Buttons.BtnCancelar.Visible = False
    Buttons.BtnCancelar.Caption = '&Cancelar'
    Buttons.BtnCancelar.Enabled = True
    Buttons.BtnCancelar.Tag = 0
    Buttons.BtnCancelar.ShowHint = False
    Buttons.BtnCancelar.Default = False
    Buttons.BtnCancelar.Cancel = True
    Buttons.BtnSair.Visible = True
    Buttons.BtnSair.Caption = '&Sair'
    Buttons.BtnSair.Enabled = True
    Buttons.BtnSair.Tag = 0
    Buttons.BtnSair.ShowHint = False
    Buttons.BtnSair.Default = False
    Buttons.BtnSair.Cancel = False
    Buttons.BtnAjuda.Visible = True
    Buttons.BtnAjuda.Caption = 'Aju&da'
    Buttons.BtnAjuda.Enabled = True
    Buttons.BtnAjuda.Tag = 0
    Buttons.BtnAjuda.ShowHint = False
    Buttons.BtnAjuda.Default = False
    Buttons.BtnAjuda.Cancel = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = True
  end
  object qryModulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseSAD'
    SQL.Strings = (
      'SELECT '
      '   IDModulo , '
      '   NOMEModulo , '
      '   NOMEPROJETO , '
      '   VERSAO,'
      '   COPIAFONTES,'
      '   COMPILADO,'
      ' OLDVERSAO,'
      ' DPL'
      'FROM '
      '   Modulo'
      'WHERE IDModulo = :IDModulo '
      'ORDER BY'
      '  NOMEModulo')
    UpdateObject = updModulo
    ValidateWithMask = True
    Left = 481
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDModulo'
        ParamType = ptUnknown
      end>
    object qryModuloNOMEModulo: TStringField
      DisplayLabel = 'Módulo'
      DisplayWidth = 25
      FieldName = 'NOMEModulo'
      Origin = 'Modulo.NOMEModulo'
      Size = 50
    end
    object qryModuloNOMEPROJETO: TStringField
      DisplayLabel = 'Projeto'
      DisplayWidth = 25
      FieldName = 'NOMEPROJETO'
      Origin = 'Modulo.NOMEPROJETO'
      Visible = False
      Size = 50
    end
    object qryModuloIDModulo: TFloatField
      DisplayWidth = 10
      FieldName = 'IDModulo'
      Origin = 'Modulo.IDModulo'
      Visible = False
    end
    object qryModuloVERSAO: TStringField
      FieldName = 'VERSAO'
      Visible = False
      Size = 10
    end
    object qryModuloCOPIAFONTES: TDateTimeField
      FieldName = 'COPIAFONTES'
      Visible = False
    end
    object qryModuloCOMPILADO: TStringField
      FieldName = 'COMPILADO'
      Visible = False
      Size = 1
    end
    object qryModuloOLDVERSAO: TStringField
      FieldName = 'OLDVERSAO'
      Origin = 'Modulo.OLDVERSAO'
      Visible = False
      Size = 10
    end
    object qryModuloDPL: TFloatField
      FieldName = 'DPL'
      Origin = 'BASESAD.MODULO.DPL'
    end
  end
  object dsModulo: TwwDataSource
    AutoEdit = False
    DataSet = qryModulo
    Left = 481
    Top = 105
  end
  object updModulo: TUpdateSQL
    ModifySQL.Strings = (
      'update Modulo'
      'set'
      '  IDModulo = :IDModulo,'
      '  VERSAO = :VERSAO,'
      '  COPIAFONTES = :COPIAFONTES,'
      '  COMPILADO = :COMPILADO,'
      '  OLDVERSAO = :OLDVERSAO'
      'where'
      '  IDModulo = :OLD_IDModulo')
    InsertSQL.Strings = (
      'insert into Modulo'
      '  (IDModulo, VERSAO, COPIAFONTES, COMPILADO, OLDVERSAO)'
      'values'
      '  (:IDModulo, :VERSAO, :COPIAFONTES, :COMPILADO, :OLDVERSAO)')
    DeleteSQL.Strings = (
      'delete from Modulo'
      'where'
      '  IDModulo = :OLD_IDModulo')
    Left = 481
    Top = 152
  end
  object ZipLibera: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = [AddDirNames, AddEncrypt]
    ExtrOptions = []
    SFXOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    OnProgress = ZipLiberaProgress
    Left = 481
    Top = 386
  end
  object dsListaPendencias: TwwDataSource
    DataSet = qListaPendencias
    Left = 481
    Top = 292
  end
  object qListaPendencias: TwwQuery
    CachedUpdates = True
    OnUpdateRecord = qListaPendenciasUpdateRecord
    DatabaseName = 'BaseInt'
    SQL.Strings = (
      'SELECT'
      '   0 as FLGTERMINADO, P.IDPENDENCIA, P.TELAModulo, P.PRAZOHORAS,'
      '   HI.DESCHISTPENDENCIA, H.SITUACAOPENDENCIA,'
      '   SUBSTR(HI.DESCHISTPENDENCIA,1,255) AS RESUMODESC,'
      '   H.DATAINICIOPREV, H.DATATERMINOPREV,'
      
        '   DECODE(H.SITUACAOPENDENCIA,1,'#39'Em Desenvolvimento'#39','#39'Em Homolog' +
        'ação'#39') as DESCSITPEND'
      'FROM'
      '   PENDENCIA P, HISTPENDENCIA H, HISTPENDENCIA HI'
      'WHERE'
      '    (P.IDModulo = :pIDModulo) AND'
      '    (P.IDPENDENCIA = H.IDPENDENCIA) AND'
      '    (P.IDPENDENCIA = HI.IDPENDENCIA) AND'
      '    ((H.IDHISTPENDENCIA = (SELECT MAX(HR.IDHISTPENDENCIA)'
      '                               FROM HISTPENDENCIA HR'
      
        '                               WHERE HR.IDPENDENCIA = P.IDPENDEN' +
        'CIA)) ) AND'
      '    ((HI.IDHISTPENDENCIA = (SELECT MIN(HIR.IDHISTPENDENCIA)'
      '                               FROM HISTPENDENCIA HIR'
      
        '                               WHERE HIR.IDPENDENCIA = P.IDPENDE' +
        'NCIA)) )'
      '     AND ( H.SITUACAOPENDENCIA BETWEEN 1 AND 2)'
      'order by P.IDPENDENCIA desc'
      ''
      ' ')
    UpdateObject = usListaPendencias
    ControlType.Strings = (
      'FLGTERMINADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 481
    Top = 245
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDModulo'
        ParamType = ptUnknown
      end>
    object qListaPendenciasFLGTERMINADO: TFloatField
      DisplayLabel = 'OK'
      DisplayWidth = 4
      FieldName = 'FLGTERMINADO'
    end
    object qListaPendenciasIDPENDENCIA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'IDPENDENCIA'
      ReadOnly = True
    end
    object qListaPendenciasDATAINICIOPREV: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 14
      FieldName = 'DATAINICIOPREV'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object qListaPendenciasDATATERMINOPREV: TDateTimeField
      DisplayLabel = 'Término'
      DisplayWidth = 14
      FieldName = 'DATATERMINOPREV'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object qListaPendenciasPRAZOHORAS: TFloatField
      DisplayLabel = 'Prazo'
      DisplayWidth = 6
      FieldName = 'PRAZOHORAS'
      ReadOnly = True
    end
    object qListaPendenciasTELAModulo: TStringField
      DisplayLabel = 'Tela'
      DisplayWidth = 30
      FieldName = 'TELAModulo'
      ReadOnly = True
      Size = 100
    end
    object qListaPendenciasRESUMODESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'RESUMODESC'
      ReadOnly = True
      Size = 255
    end
    object qListaPendenciasDESCHISTPENDENCIA: TMemoField
      FieldName = 'DESCHISTPENDENCIA'
      ReadOnly = True
      Visible = False
      BlobType = ftMemo
      Size = 1000
    end
    object qListaPendenciasSITUACAOPENDENCIA: TFloatField
      FieldName = 'SITUACAOPENDENCIA'
      ReadOnly = True
      Visible = False
    end
  end
  object CMPendencia: TCMPendencia
    DatabaseName = 'BaseInt'
    CommitKind = ckDeveloper
    Left = 481
    Top = 339
  end
  object usListaPendencias: TUpdateSQL
    Left = 481
    Top = 199
  end
  object QryPathFontes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseSAD'
    SQL.Strings = (
      'SELECT DIRFONTES FROM MODULO WHERE IDMODULO = :IDMODULO ')
    ValidateWithMask = True
    Left = 480
    Top = 11
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
  end
  object MsModulo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Módulo'
    Colunas.Strings = (
      'MODULO.NOMEMODULO'
      'MODULO.NOMEPROJETO'
      'MODULO.FLGGRUPODESENV')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Módulo'
      'Nome Projeto'
      'Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MODULO')
    CamposChave.Strings = (
      'MODULO.IDMODULO'
      'MODULO.NOMEMODULO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '1')
    DataBaseName = 'BaseSAD'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 116
    Top = 12
  end
end

inherited frmAcertaSequence: TfrmAcertaSequence
  Left = 160
  Top = 143
  Caption = 'Acerto de Controles Internos'
  ClientWidth = 600
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    object pgctrlAcerto: TPageControl
      Left = 1
      Top = 1
      Width = 598
      Height = 232
      ActivePage = tbsAcertaSequence
      Align = alClient
      TabOrder = 0
      object tbsAcertaSequence: TTabSheet
        Caption = 'Códigos Internos ( "Sequences" )'
        object Label1: TLabel
          Left = 27
          Top = 15
          Width = 94
          Height = 13
          Caption = 'Nome da Tabela'
        end
        object Label2: TLabel
          Left = 27
          Top = 60
          Width = 172
          Height = 13
          Caption = 'Nome do Campo do Sequence'
        end
        object lblMaxTabela: TLabel
          Left = 255
          Top = 63
          Width = 116
          Height = 13
          Caption = 'Máximo na Tabela : '
        end
        object lblSequence: TLabel
          Left = 255
          Top = 81
          Width = 66
          Height = 13
          Caption = 'Sequence :'
        end
        object lblIncrement: TLabel
          Left = 255
          Top = 99
          Width = 92
          Height = 13
          Caption = 'Incrementados :'
        end
        object edTabela: TEdit
          Left = 27
          Top = 30
          Width = 295
          Height = 21
          TabOrder = 0
        end
        object edSequence: TEdit
          Left = 27
          Top = 78
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object tbsAcertaUltMesPreparo: TTabSheet
        Caption = 'Último Mês de Preparo'
        ImageIndex = 1
        object lblContUltMesPreparo: TLabel
          Left = 9
          Top = 180
          Width = 142
          Height = 13
          Caption = 'Registros Atualizados : 0'
        end
        object dbgrdPatro: TwwDBGrid
          Left = 0
          Top = 3
          Width = 286
          Height = 172
          Selected.Strings = (
            'FLGPROCESSA'#9'5'#9'OK'
            'NOME'#9'30'#9'Patrocinadora')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsPatro
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object wwDBGrid1: TwwDBGrid
          Left = 294
          Top = 3
          Width = 286
          Height = 172
          Selected.Strings = (
            'FLGPROCESSA'#9'5'#9'OK'
            'NOME'#9'30'#9'Plano'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsPlano
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsTransfPlano: TTabSheet
        Caption = 'Transferência de Plano'
        ImageIndex = 2
        object Label3: TLabel
          Left = 12
          Top = 27
          Width = 527
          Height = 13
          Caption = 
            'Clique no "Acertar" e os eventos de Transferência de Plano serão' +
            ' conferidos e acertados ...'
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 273
      DockPos = 273
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 104
      DockPos = 104
      inherited bbtnConfirmar: TBitBtn
        Caption = 'A&certar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65533
    Top = 250
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 33
    Top = 237
  end
  object qryPatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS FLGPROCESSA, P.IDPESSOA, P.NOME'
      'FROM    PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'ORDER BY P.NOME')
    UpdateObject = updPatro
    ControlType.Strings = (
      'FLGPROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 564
    Top = 5
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS FLGPROCESSA, IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    UpdateObject = updPlano
    ControlType.Strings = (
      'FLGPROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 564
    Top = 49
  end
  object updPatro: TUpdateSQL
    Left = 564
    Top = 216
  end
  object updPlano: TUpdateSQL
    Left = 564
    Top = 206
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 567
    Top = 158
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 561
    Top = 105
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 513
    Top = 242
  end
end

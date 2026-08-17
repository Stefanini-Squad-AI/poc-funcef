inherited frmRelLogTotalPrev: TfrmRelLogTotalPrev
  Left = 16
  Top = 75
  ClientHeight = 440
  ClientWidth = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 407
    inherited pgcControle: TPageControl
      Width = 774
      Height = 374
      inherited TabSheet1: TTabSheet
        object chkFiltroOrigem: TCheckBox
          Left = 32
          Top = 154
          Width = 121
          Height = 17
          Caption = 'Filtrar por Origem: '
          TabOrder = 0
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 24
          Top = 16
          Width = 705
          Height = 41
          TabOrder = 1
          inherited edtNome: TEdit
            Width = 449
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 648
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 672
          end
        end
        object cboOrigem: TwwDBComboBox
          Left = 160
          Top = 152
          Width = 305
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Concessão/Renovação'#9'0'
            'Geração de Parcelas'#9'1'
            'Amortização'#9'2'
            'Quitação Antecipada'#9'3'
            'Tratamento de divergência'#9'4'
            'Atualização Diária'#9'5'
            'Recálculo Diário'#9'6'
            'Tratamento Individual'#9'7'
            'Quitação por Morte/Invalidez'#9'8'
            'Importação/Migração'#9'9'
            'Quitação por Resgate'#9'10'
            'Recebimento'#9'11'
            'Entrada Manual'#9'12')
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object GroupBox1: TGroupBox
          Left = 304
          Top = 264
          Width = 417
          Height = 73
          Caption = ' Período de Datas: '
          TabOrder = 3
          object Label1: TLabel
            Left = 16
            Top = 36
            Width = 38
            Height = 13
            Caption = 'Início:'
          end
          object Label2: TLabel
            Left = 224
            Top = 36
            Width = 50
            Height = 13
            Caption = 'Término:'
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 64
            Top = 32
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtDataFim: TwwDBDateTimePicker
            Left = 280
            Top = 32
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        inline MolUsuario: TmolUsuario
          Left = 24
          Top = 72
          Width = 710
          TabOrder = 4
          inherited edtUsuario: TEdit
            Width = 385
          end
          inherited btnBuscaUsuario: TBitBtn
            Left = 392
            OnClick = MolUsuariobtnBuscaUsuarioClick
          end
          inherited btnLimpaUsuario: TBitBtn
            Left = 416
            OnClick = MolUsuariobtnLimpaUsuarioClick
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object Label3: TLabel
          Left = 156
          Top = 340
          Width = 106
          Height = 13
          Caption = 'Nome do Usuário: '
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 16
          Top = 34
          Width = 736
          Height = 218
          Selected.Strings = (
            'DATA'#9'20'#9'Data e Horário'#9'F'
            'IDCONTRATOEMPTMO'#9'17'#9'Contrato'#9'F'
            'IDHISTMOVEMPTMO'#9'17'#9'IDHist'#9'F'
            'DESC_ORIGEM'#9'32'#9'Origem'#9'F'
            'VERSAO'#9'10'#9'Versão'#9'F'
            'NOMEUSUARIO'#9'16'#9'Usuário'#9'F'
            'NOME'#9'55'#9'NOME'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsLogTotalPrev
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 737
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Eventos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 282
          Width = 737
          Height = 47
          DataField = 'DESCOPERACAO'
          DataSource = dsLogTotalPrev
          TabOrder = 2
        end
        object Panel2: TPanel
          Left = 16
          Top = 256
          Width = 737
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Descrição do Evento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBedtNomeUsuario: TDBEdit
          Left = 264
          Top = 336
          Width = 489
          Height = 21
          DataField = 'NOME'
          DataSource = dsLogTotalPrev
          TabOrder = 4
        end
      end
    end
    inherited Panel1: TPanel
      Width = 774
      inherited fcLabel1: TfcLabel
        Width = 397
        Caption = 'Consulta ao Log de Eventos [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 774
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65515
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LTP.IDLOGTOTALPREV,'
      '   LTP.IDMODULO,'
      ''
      '   LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,'
      '   LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,'
      ''
      '   LTP.ORIGEM,'
      '   DECODE(LTP.ORIGEM,'
      '           0, '#39'Concessão/Renovação'#39','
      '           1, '#39'Geração de Parcelas'#39','
      '           2, '#39'Amortização/Refinanciamento'#39','
      '           3, '#39'Quitação Antecipada'#39','
      '           4, '#39'Tratamento de Divergências'#39','
      '           5, '#39'Atualização de Saldo (Diária)'#39','
      '           6, '#39'Recálculo Diário'#39','
      '           7, '#39'Tratamento Individual'#39','
      '           8, '#39'Quitação por Morte/Invalidez'#39','
      '           9, '#39'Importação/Migração'#39','
      '          10, '#39'Quitação por Resgate'#39','
      '          11, '#39'Recebimento'#39','
      '          12, '#39'Entrada Manual'#39','
      '          13, '#39'Alteração de Concessão'#39','
      '          14, '#39'Tratamento de Valores Não Programados'#39','
      '          15, '#39'Consulta de Contratos'#39','
      '          16, '#39'Cancelamento de Concessão'#39','
      '          17, '#39'Alteração Contratual'#39','
      '          18, '#39'Liberação de Concessão'#39','
      '          19, '#39'Envio'#39','
      '          41, '#39'Contabilização em Lote de Concessão'#39','
      '          42, '#39'Contabilização em Lote de Prestação'#39','
      '          43, '#39'Contabilização em Lote de Amortização'#39','
      '          44, '#39'Contabilização em Lote de Quitação'#39','
      '          45, '#39'Contabilização em Lote de Encargos'#39','
      '          46, '#39'Contabilização em Lote de Atualização Diária'#39','
      '          47, '#39'Contabilização em Lote de Ajustes'#39','
      '          51, '#39'Desfazer Geração de Parcelas'#39','
      '          52, '#39'Cancelamento de Amortização'#39','
      '          53, '#39'Cancelamento de Quitação'#39','
      '          61, '#39'Desfazer Envio'#39','
      '          62, '#39'Desfazer Recebimento'#39
      '         ) AS DESC_ORIGEM,'
      ''
      '   LTP.DESCOPERACAO, LTP.DATA, LTP.IDUSUARIO, LTP.VERSAO,'
      ''
      '   USU.NOMEUSUARIO,'
      '   PSU.NOME'
      ''
      'FROM'
      '   PESSOA         PSU,'
      '   LOGTOTALPREV   LTP,'
      '   USUARIOSISTEMA USU'
      ''
      'WHERE'
      '       LTP.IDMODULO  = 15'
      '   AND (:PIDCONTRATO IS NULL  OR LTP.IDPESQUISA1 =:PIDCONTRATO)'
      '   AND (:PORIGEM     IS NULL  OR LTP.ORIGEM      =:PORIGEM)'
      '   AND (:PDATAINI    IS NULL  OR LTP.DATA        >=:PDATAINI)'
      '   AND (:PDATAFIM    IS NULL  OR LTP.DATA        <=:PDATAFIM)'
      '   AND (:PIDUSUARIO  IS NULL  OR LTP.IDUSUARIO   =:PIDUSUARIO)'
      '   AND (:PIDUSUARIO  IS NULL  OR USU.IDUSUARIO   =:PIDUSUARIO)'
      '   AND (:PIDUSUARIO  IS NULL  OR PSU.IDPESSOA    =:PIDUSUARIO)'
      ''
      '   AND LTP.IDUSUARIO = USU.IDUSUARIO(+)'
      '   AND USU.IDUSUARIO = PSU.IDPESSOA(+)'
      ' ')
    ValidateWithMask = True
    Left = 460
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end>
    object qryLogTotalPrevIDLOGTOTALPREV: TFloatField
      FieldName = 'IDLOGTOTALPREV'
    end
    object qryLogTotalPrevIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryLogTotalPrevIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryLogTotalPrevIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryLogTotalPrevORIGEM: TFloatField
      FieldName = 'ORIGEM'
    end
    object qryLogTotalPrevDESC_ORIGEM: TStringField
      FieldName = 'DESC_ORIGEM'
      Size = 25
    end
    object qryLogTotalPrevDESCOPERACAO: TStringField
      FieldName = 'DESCOPERACAO'
      Size = 100
    end
    object qryLogTotalPrevDATA: TDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
    end
    object qryLogTotalPrevIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryLogTotalPrevVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryLogTotalPrevNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryLogTotalPrevNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsLogTotalPrev: TwwDataSource
    DataSet = qryLogTotalPrev
    Left = 556
    Top = 7
  end
end

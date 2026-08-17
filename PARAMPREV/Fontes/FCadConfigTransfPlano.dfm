inherited frmCadConfigTransfPlano: TfrmCadConfigTransfPlano
  Left = 317
  Top = 385
  HelpContext = 160118
  Caption = 'Configuração das Opções de Transferência de Plano'
  ClientHeight = 454
  ClientWidth = 733
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 368
    inherited pnlMestre: TPanel
      Width = 731
      Height = 108
      Align = alClient
      object Label2: TLabel
        Left = 97
        Top = 14
        Width = 141
        Height = 13
        Caption = 'Evento de Transferência'
      end
      object lblCodigo: TLabel
        Left = 12
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 97
        Top = 56
        Width = 142
        Height = 13
        Caption = 'Opção de Transferência '
      end
      object dbedTitulo: TwwDBEdit
        Left = 97
        Top = 28
        Width = 386
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCodigoCargoExt: TDBEdit
        Left = 11
        Top = 28
        Width = 73
        Height = 21
        Color = clSilver
        DataField = 'IDEVENTOGERADOR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object wwDBEdit1: TwwDBEdit
        Left = 97
        Top = 70
        Width = 386
        Height = 21
        Color = clSilver
        DataField = 'NOME_1'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 109
      Width = 731
      Height = 258
      Align = alBottom
      Tabs.Strings = (
        'Configuração da Opção de Transferência')
      inherited pgctrlDetalhe: TPageControl
        Width = 633
        Height = 199
        inherited tbsDet: TTabSheet
          Caption = 'Configuração da Opção de Transferência'
          inherited dbgrdDet: TwwDBGrid
            Width = 625
            Height = 171
            Selected.Strings = (
              'IDTIPOTRANSF'#9'10'#9'Código'
              'NOME'#9'45'#9'Descrição'#9'F'
              'IDREGRA'#9'10'#9'Cód.Regra'
              'ORDEM'#9'10'#9'Nº Ordem')
          end
          inherited pnlControlesDet: TPanel
            Width = 625
            Height = 171
            BevelInner = bvLowered
            object Label1: TLabel
              Left = 12
              Top = 12
              Width = 79
              Height = 13
              Caption = 'Nome do Item'
            end
            object lblCampoRegra: TLabel
              Left = 12
              Top = 58
              Width = 101
              Height = 13
              Caption = 'Ordem de Cálculo'
            end
            object lblRegraCalc: TLabel
              Left = 219
              Top = 58
              Width = 313
              Height = 13
              Caption = 'Regra de Cálculo do Item (Valor Principal - Obrigatório)'
            end
            object Label15: TLabel
              Left = 12
              Top = 98
              Width = 30
              Height = 13
              Caption = 'Tipo '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 219
              Top = 98
              Width = 316
              Height = 13
              Caption = 'Regra de Cálculo do Item (Valor Secundário - Opcional)'
            end
            object dbedDescInput: TDBEdit
              Left = 12
              Top = 28
              Width = 526
              Height = 21
              DataField = 'NOME'
              DataSource = dsDet
              TabOrder = 0
            end
            object dbedOrdem: TDBEdit
              Left = 12
              Top = 72
              Width = 196
              Height = 21
              DataField = 'ORDEM'
              DataSource = dsDet
              TabOrder = 1
            end
            object dblkpcmbRegraCalc: TwwDBLookupCombo
              Left = 219
              Top = 72
              Width = 319
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 12
              Top = 111
              Width = 196
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPO'#9'24'#9'Tipo'#9'F')
              DataField = 'TIPODADO'
              LookupTable = qryTipoDado
              LookupField = 'CODIGO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 219
              Top = 111
              Width = 319
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo'#9'F')
              DataField = 'IDREGRA2'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 723
      end
      inherited Dock974: TDock97
        Left = 637
        Height = 199
      end
    end
  end
  inherited Dock972: TDock97
    Width = 733
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 733
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 609
    Top = 489
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 334
    Top = 188
  end
  inherited ds: TwwDataSource
    Left = 429
    Top = 45
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOGERADOR'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    InsertSQL.Strings = (
      'insert into EVENTOGERADOR'
      '  (IDEVENTOGERADOR, NOME)'
      'values'
      '  (:IDEVENTOGERADOR, :NOME)')
    DeleteSQL.Strings = (
      'delete from EVENTOGERADOR'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    Left = 473
    Top = 45
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Evento Gerador e Opção'
    Colunas.Strings = (
      'EVENTOGERADOR.NOME'
      'TIPOSTRANSFPLANO.NOME'
      'TIPOSTRANSFPLANO.IDEVENTOGERADOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Evento'
      'Opção de Transferência'
      'Código do Evento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOGERADOR'
      'TIPOSTRANSFPLANO')
    CamposChave.Strings = (
      'EVENTOGERADOR.IDEVENTOGERADOR'
      'TIPOSTRANSFPLANO.IDTIPOTRANSF')
    Filtro.Strings = (
      'EVENTOGERADOR.FLGINTERNO = '#39'TP'#39
      'TIPOSTRANSFPLANO.IDEVENTOGERADOR = EVENTOGERADOR.IDEVENTOGERADOR'
      'TIPOSTRANSFPLANO.FLGTIPO IN ('#39'E'#39','#39'O'#39')')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 289
    Top = 1
  end
  object qryRegra: TwwQuery [8]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 581
    Top = 1
  end
  object updDet: TUpdateSQL [9]
    ModifySQL.Strings = (
      'update CONFIGTRANSFPLANO'
      'set'
      '  NOME = :NOME,'
      '  IDREGRA = :IDREGRA,'
      '  IDREGRA2 = :IDREGRA2,'
      '  ORDEM = :ORDEM,'
      '  TIPO = :TIPO,'
      '  TIPODADO = :TIPODADO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF and'
      '  IDCONFIG = :OLD_IDCONFIG')
    InsertSQL.Strings = (
      'insert into CONFIGTRANSFPLANO'
      
        '  (IDEVENTOGERADOR, IDTIPOTRANSF, IDCONFIG, NOME, IDREGRA, IDREG' +
        'RA2, ORDEM, '
      '   TIPO, TIPODADO)'
      'values'
      
        '  (:IDEVENTOGERADOR, :IDTIPOTRANSF, :IDCONFIG, :NOME, :IDREGRA, ' +
        ':IDREGRA2, '
      '   :ORDEM, :TIPO, :TIPODADO)')
    DeleteSQL.Strings = (
      'delete from CONFIGTRANSFPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF and'
      '  IDCONFIG = :OLD_IDCONFIG')
    Left = 387
    Top = 188
  end
  inherited ImlPadrao: TImageList
    Left = 516
    Top = 489
  end
  object qryDet: TwwQuery [11]
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDEVENTOGERADOR, IDTIPOTRANSF, IDCONFIG, NOME, IDREGRA, I' +
        'DREGRA2, ORDEM, TIPO, TIPODADO'
      'FROM   CONFIGTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    IDTIPOTRANSF = :IDTIPOTRANSF'
      'ORDER BY ORDEM, NOME'
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 334
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOTRANSF'
        ParamType = ptUnknown
      end>
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 376
    Top = 1
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT E.IDEVENTOGERADOR,E.NOME, T.IDTIPOTRANSF, T.NOME'
      'FROM   EVENTOGERADOR E, TIPOSTRANSFPLANO T'
      'WHERE  T.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    T.IDTIPOTRANSF    = :IDTIPOTRANSF'
      'AND    E.IDEVENTOGERADOR = T.IDEVENTOGERADOR')
    Left = 429
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOTRANSF'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 277
    Top = 142
  end
  object qryTipoDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Numérico'#39' AS TIPO,                 '#39'N'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Alfanumérico'#39' AS TIPO,             '#39'C'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Data'#39' AS TIPO,                     '#39'D'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Anos e Meses'#39' AS TIPO,    '#39'I'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Anos Completos'#39' AS TIPO,  '#39'A'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Meses Completos'#39' AS TIPO, '#39'M'#39' AS CODIGO FROM DU' +
        'AL'
      '')
    ValidateWithMask = True
    Left = 649
    Top = 291
  end
end

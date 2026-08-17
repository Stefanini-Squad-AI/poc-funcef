inherited frmCadTipoDespInvestMT: TfrmCadTipoDespInvestMT
  Left = 160
  Top = 175
  HelpContext = 790132
  Caption = 'Cadastro'
  ClientHeight = 309
  ClientWidth = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 192
    inherited pnlControles: TPanel
      Width = 536
      Height = 190
      object LbLDescParamEmissor: TLabel
        Left = 12
        Top = 15
        Width = 62
        Height = 13
        Caption = 'Descrição '
      end
      object LblIdRegra: TLabel
        Left = 12
        Top = 55
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object DBEDescricao: TwwDBEdit
        Left = 12
        Top = 29
        Width = 317
        Height = 21
        DataField = 'DESCTIPODESPINV'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBLkMoeda: TwwDBLookupCombo
        Left = 12
        Top = 71
        Width = 221
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Moeda'#9'F')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = CdsMoeda
        LookupField = 'MOECODIGO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbeCodigo: TwwDBEdit
        Left = 335
        Top = 29
        Width = 63
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDTIPODESPINVEST'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBRNaturezaOp: TDBRadioGroup
        Left = 12
        Top = 103
        Width = 293
        Height = 66
        Caption = ' Atualizações na Carteira '
        DataField = 'NATUREZAOPERACAO'
        DataSource = ds
        Items.Strings = (
          'D&espesa'
          '&Lucro'
          '&Não Altera')
        TabOrder = 3
        Values.Strings = (
          'E'
          'L'
          'N')
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 536
      Height = 190
      Selected.Strings = (
        'DESCTIPODESPINV'#9'40'#9'Descrição'#9'F'
        'MOEDESC'#9'20'#9'Moeda'#9'F'
        'NATUREZAOPERACAO'#9'1'#9'Natureza~da opercação'#9'F')
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 538
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 366
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
    end
  end
  inherited pnlTitulo: TPanel
    Width = 538
    inherited lbNomItem: TfcLabel
      Width = 171
      Caption = 'Tipos de Rubrica'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 322
  end
  inherited ImlPadrao: TImageList
    Left = 368
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 296
    Top = 127
  end
  inherited Cds: TCMClientDataSet
    Left = 204
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TIPODESPINVEST.DESCTIPODESPINV')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição da Rubrica')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPODESPINVEST')
    CamposChave.Strings = (
      'TIPODESPINVEST.IDTIPODESPINVEST')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 156
    Top = 207
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 193
    Top = 143
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT TI.IDTIPODESPINVEST,'
      '       TI.DESCTIPODESPINV,'
      '       TI.MOECODIGO,'
      '       M.MOEDESC,'
      '       TI.NATUREZAOPERACAO,'
      
        '       DECODE(TI.NATUREZAOPERACAO,'#39'L'#39','#39'Lucro'#39','#39'E'#39','#39'Despesa'#39','#39'N'#39',' +
        #39'Não Altera'#39') as DESCNATOP,'
      '       TIPCREDOR '
      ''
      'FROM TIPODESPINVEST TI,MOEDA M'
      ''
      'WHERE TI.MOECODIGO = M.MOECODIGO'
      'ORDER BY DESCTIPODESPINV')
    Left = 304
    Top = 182
  end
end

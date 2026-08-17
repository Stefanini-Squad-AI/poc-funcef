inherited FrmCadConvenioBancoMT: TFrmCadConvenioBancoMT
  Left = 397
  Top = 180
  Caption = 'Cadastro de Convênios Bancários'
  ClientHeight = 320
  ClientWidth = 342
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    Height = 234
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 122
      Height = 13
      Caption = 'Num. Empresa Banco'
    end
    object Label2: TLabel
      Left = 248
      Top = 25
      Width = 79
      Height = 13
      Caption = 'Ctrl. Remessa'
    end
    object Label3: TLabel
      Left = 16
      Top = 91
      Width = 212
      Height = 13
      Caption = 'Descrição do Convênio Com o Banco'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 16
      Top = 40
      Width = 216
      Height = 21
      DataField = 'NUMEMPRESABANCO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBSpinEdit1: TwwDBSpinEdit
      Left = 246
      Top = 40
      Width = 81
      Height = 21
      Increment = 1
      DataField = 'CONTROLEREMESSA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object wwDBEdit2: TwwDBEdit
      Left = 16
      Top = 106
      Width = 313
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Memo1: TMemo
      Left = 15
      Top = 145
      Width = 313
      Height = 65
      Color = clScrollBar
      Lines.Strings = (
        'Convênio com o Banco que é relacionado no '
        'cadastro de portadorfoma, com o seu devido número '
        'sequencial para controle de remessa de arquivos '
        'bancários.')
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 342
  end
  inherited Dock971: TDock97
    Top = 281
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 170
      DockPos = 480
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 1
      inherited bbtnCancelar: TBitBtn
        Height = 32
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 458
    Top = 63
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 23
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 272
    Top = 111
  end
  inherited Cds: TCMClientDataSet
    Left = 292
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SEQREMESSA.NUMEMPRESABANCO'
      'SEQREMESSA.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Num. Empresa Banco'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SEQREMESSA')
    CamposChave.Strings = (
      'SEQREMESSA.NUMEMPRESABANCO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '25')
    Left = 248
    Top = 31
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT NODOCUMENTO, COMPLDOCUMENTO  FROM DOCUMENTO'
      
        '                           WHERE CODDOCUMENTO =  ( SELECT MAX(CO' +
        'DDOCUMENTO) '
      
        '                            FROM DOCUMENTO D, PORTADORFORMA PF, ' +
        'SEQREMESSA S'
      
        '                            WHERE D.CODPORTFORMA = PF.CODPORTFOR' +
        'MA AND  '
      
        '                           PF.NUMEMPRESABANCO = S.NUMEMPRESABANC' +
        'O)'
      '')
    ClientDataSet = CdsAux
    Left = 192
    Top = 110
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 164
    Top = 109
  end
end

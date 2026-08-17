inherited FrmparamBBpagMT: TFrmparamBBpagMT
  Left = 222
  Top = 230
  ActiveControl = medtMensagem1
  Caption = 'Pagamentos Banco do Brasil'
  ClientHeight = 142
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 40
    Width = 72
    Height = 13
    Caption = 'Mensagem 1'
  end
  object Label15: TLabel [1]
    Left = 16
    Top = 7
    Width = 512
    Height = 26
    Caption = 
      'Atenção: Os Dados informados nesta seção são genéricos e serão a' +
      'ssociados a todos os documentos do arquivo'
    WordWrap = True
  end
  inherited pnlFundo: TPanel
    Height = 103
    object Label2: TLabel
      Left = 17
      Top = 10
      Width = 72
      Height = 13
      Caption = 'Mensagem 1'
    end
    object Label3: TLabel
      Left = 16
      Top = 50
      Width = 104
      Height = 13
      Caption = 'Controle das Vans'
    end
    object edtcontrvan: TEditNum
      Left = 15
      Top = 65
      Width = 105
      Height = 21
      MaxLength = 3
      TabOrder = 0
      IntDigits = 3
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object chktpserv: TCheckBox
      Left = 368
      Top = 60
      Width = 143
      Height = 32
      Caption = 'Cobrança Sem Papel'
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 103
    inherited tb97Fundo: TToolbar97
      Left = 353
      DockPos = 353
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 185
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object medtMensagem1: TMaskEdit [4]
    Left = 15
    Top = 23
    Width = 498
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 40
    TabOrder = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 131
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end

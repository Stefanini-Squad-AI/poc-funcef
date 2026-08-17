inherited RelContrato: TRelContrato
  Left = 83
  HelpContext = 1350053
  Caption = 'Parcelas de Contratos'
  ClientWidth = 551
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    inline molProposta1: TmolProposta
      Left = 23
      Top = 16
      inherited Label1: TLabel
        Width = 85
        Caption = 'Nº do Contrato'
      end
      inherited Label2: TLabel
        Width = 103
        Caption = 'Nome do Contrato'
      end
      inherited btnBuscaProp: TBitBtn
        Top = 17
        OnClick = molProposta1btnBuscaPropClick
      end
      inherited btnLimpaProp: TBitBtn
        Top = 17
      end
    end
    inline molComprador1: TmolComprador
      Left = 19
      Top = 64
      Width = 526
      TabOrder = 1
      inherited edtRazaoSocial: TEdit
        Width = 453
      end
      inherited btnBuscaForn: TBitBtn
        Left = 461
        Top = 17
      end
      inherited btnLimpaForn: TBitBtn
        Left = 485
        Top = 17
      end
    end
    inline molResponsavel1: TmolResponsavel
      Left = 18
      Top = 112
      Width = 519
      TabOrder = 2
      inherited edtResponsavel: TEdit
        Width = 452
      end
      inherited btnBuscaResponsavel: TBitBtn
        Left = 461
        Top = 17
      end
      inherited btnLimpaResponsavel: TBitBtn
        Left = 485
        Top = 17
      end
      inherited btnAbrePessoa: TBitBtn
        Visible = False
      end
    end
    inline molImovelMestre1: TmolImovelMestre
      Left = 19
      Top = 160
      Width = 513
      TabOrder = 3
      inherited edtImovel: TEdit
        Width = 452
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 460
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 484
      end
    end
  end
  inherited Dock971: TDock97
    Width = 551
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 3
  end
end

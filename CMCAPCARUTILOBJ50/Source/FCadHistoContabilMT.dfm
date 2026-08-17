inherited FrmCadHistoContabilMT: TFrmCadHistoContabilMT
  Left = 125
  Top = 59
  Caption = 'Cadastros de Históricos Contábeis'
  ClientHeight = 496
  ClientWidth = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 679
    Height = 410
    inherited LblDescHistorico: TLabel
      Left = 313
    end
    inherited BvlHistorico: TBevel
      Left = 313
      Width = 343
    end
    inherited RgTipoHistorico: TDBRadioGroup
      Top = 10
      Width = 286
      Height = 104
      Items.Strings = (
        '&Baixa de Documento'
        '&Reversão de Antecipação (Baixa de Doc.)'
        'Lançamento de &Documentos'
        'Lançamento de &Alteradores'
        '&Estorno de Baixa')
      Values.Strings = (
        '0'
        '5'
        '1'
        '2'
        '3'
        '4')
      OnChange = RgTipoHistoricoChange
    end
    inherited DbeDescricao: TDBEdit
      Left = 313
      Top = 28
      Width = 340
    end
    inherited CkbAtivo: TDBCheckBox
      Left = 330
      Top = 81
    end
    inherited PnlModelo: TPanel
      Width = 639
      Height = 273
      object Bevel1: TBevel [0]
        Left = 295
        Top = 12
        Width = 328
        Height = 76
      end
      inherited LblTextoFixo: TLabel
        Left = 306
        Top = 16
      end
      inherited LblCompoHistorico: TLabel
        Left = 309
        Top = 100
      end
      inherited BtnAdd: TSpeedButton
        Left = 273
        Top = 125
      end
      inherited BtnDelete: TSpeedButton
        Left = 273
        Top = 157
      end
      inherited BtnUp: TSpeedButton
        Left = 273
        Top = 189
      end
      inherited BtnDwn: TSpeedButton
        Left = 273
        Top = 221
      end
      inherited EdtTextoFixo: TEdit
        Left = 306
        Top = 35
        Width = 308
      end
      inherited LbCampoBanco: TListBox
        Width = 251
        Height = 233
        Items.Strings = (
          'Nº do Documento'
          'Complemento'
          'Razão Social'
          'Descrição do Lançamento'
          'Nº do Cheque\Borderô'
          'Nº do SLIP'
          'Histórico Complementar'
          'Nº AP'
          'Nº do LOTE')
      end
      inherited LbHistCompo: TListBox
        Left = 309
        Top = 118
        Width = 308
      end
      object chkTitulo: TCheckBox
        Left = 310
        Top = 65
        Width = 120
        Height = 17
        Caption = 'Título de Campo'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  inherited Dock972: TDock97
    Width = 679
  end
  inherited Dock971: TDock97
    Top = 457
    Width = 679
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 551
  end
  inherited ds: TwwDataSource
    Left = 323
  end
  inherited ImlPadrao: TImageList
    Left = 513
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 437
  end
  inherited Cds: TCMClientDataSet
    Left = 361
  end
  inherited MontaSelect: TMontaSelect
    Left = 475
  end
  inherited SQL: TCMSqlParams
    Left = 399
  end
end

inherited FrmCadHistoContabilMT: TFrmCadHistoContabilMT
  Left = 126
  Top = 74
  Caption = 'Cadastros de Históricos Contábeis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited LblDescHistorico: TLabel
      Left = 252
    end
    inherited RgTipoHistorico: TDBRadioGroup
      Top = 16
      Height = 96
      Items.Strings = (
        '&Baixa de Documento'
        'Lançamento de &Documentos'
        'Lançamento de &Alteradores'
        '&Estorno de Baixa')
      Values.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4')
      OnChange = RgTipoHistoricoChange
    end
    inherited DbeDescricao: TDBEdit
      Left = 252
      Width = 330
    end
    inherited PnlModelo: TPanel
      inherited LbCampoBanco: TListBox
        Items.Strings = (
          'Nº do Documento'
          'Complemento'
          'Razão Social'
          'Descrição do Lançamento'
          'Nº do Cheque\Borderô'
          'Nº do SLIP'
          'Histórico Complementar')
      end
    end
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

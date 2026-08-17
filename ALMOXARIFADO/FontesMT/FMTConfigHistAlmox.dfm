inherited FrmMTConfigHistAlmox: TFrmMTConfigHistAlmox
  Left = 57
  Top = 81
  Caption = 'Configuração de Modelos de Histórico'
  ClientHeight = 463
  ClientWidth = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 656
    Height = 377
    inherited LblDescHistorico: TLabel
      Left = 362
    end
    inherited BvlHistorico: TBevel
      Left = 560
      Top = 232
      Width = 17
      Height = 37
      Visible = False
    end
    inherited RgTipoHistorico: TDBRadioGroup
      Left = 16
      Top = 8
      Width = 329
      Height = 121
      Items.Strings = (
        'Recebimento de Mercadoria'
        'Devolução de Mercadoria'
        'Nota Complementar'
        'Custos Agregados'
        'Integração dos Custos Contábeis - Transferência'
        'Integração dos Custos Contábeis - Custo'
        'Integração dos Custos Contábeis - Baixa por Perda')
      Values.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6')
      OnChange = RgTipoHistoricoChange
    end
    inherited DbeDescricao: TDBEdit
      Left = 360
      Top = 32
      Width = 281
    end
    inherited CkbAtivo: TDBCheckBox
      Left = 360
      Top = 72
    end
    inherited PnlModelo: TPanel
      Left = 16
      Top = 136
      Width = 625
      inherited LblTextoFixo: TLabel
        Left = 289
      end
      inherited LblCompoHistorico: TLabel
        Left = 320
      end
      inherited BtnAdd: TSpeedButton
        Left = 289
      end
      inherited BtnDelete: TSpeedButton
        Left = 289
      end
      inherited BtnUp: TSpeedButton
        Left = 289
      end
      inherited BtnDwn: TSpeedButton
        Left = 289
      end
      inherited EdtTextoFixo: TEdit
        Left = 289
      end
      inherited LbCampoBanco: TListBox
        Width = 264
      end
      inherited LbHistCompo: TListBox
        Left = 320
      end
    end
  end
  inherited Dock972: TDock97
    Width = 656
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 656
  end
  inherited SQL: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDMODELOHISTORICO,'
      '   TIPO,'
      '   DESCRICAO,'
      '   STATUS,'
      '   IDMODULO,'
      '   COMPOHISTORICO,'
      '   '#39'N'#39' AS FLGMODELOPADRAO,'
      '   IDPESSOA'
      'FROM'
      '   MODELOHISTORICO'
      'WHERE'
      '   IDMODELOHISTORICO = :IDMODELOHISTORICO')
  end
end

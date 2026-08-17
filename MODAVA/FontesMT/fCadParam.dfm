inherited frmCadParam: TfrmCadParam
  Left = 147
  Top = 118
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 409
  ClientWidth = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 323
    BorderWidth = 2
    object gbxDoisCargos: TDBRadioGroup
      Left = 40
      Top = 9
      Width = 440
      Height = 56
      Hint = 'Dois Cargos Para a Mesma Pessoa, Tipo Cargo e Função ?'
      Caption = 
        'Nas Avaliações de Desempenho, Todos os Fatores Devem ser Exibido' +
        's ?'
      Columns = 2
      DataField = 'FLGFILTRAFATOR'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Values.Strings = (
        '0'
        '1')
    end
    object Memo1: TMemo
      Left = 40
      Top = 73
      Width = 440
      Height = 234
      TabStop = False
      Color = clScrollBar
      Lines.Strings = (
        'CONCEITUAÇÃO'
        '----------------------------'
        
          'O sistema possui uma importante funcionalidade, que é a de avali' +
          'ar o '
        
          'potencial das pessoas para o exercício de funções diferentes das' +
          ' que são '
        'exercidas atualmente.'
        ''
        
          'Por exemplo, pode-se solicitar o potencial de um empregado para ' +
          'um cargo '
        'de chefia, quando não é o seu caso no momento.'
        ''
        
          'Para que isto seja viável, orienta-se que, nas avaliações de des' +
          'empenho, '
        
          'TODOS os fatores devem ser avaliados, mesmo aqueles que não seja' +
          'm '
        
          'relevantes para o cargo atual, mas que podem ser para outras ati' +
          'vidades.'
        ''
        
          'Se você deseja usar este recurso, marque "Sim" acima. Se, por ou' +
          'tro lado, '
        
          'por qualquer motivo não o quiser, marque "Não". Isto fará com qu' +
          'e '
        'somente os fatores atinentes à função atual do empregado sejam '
        'oferecidos no momento de fazer e reportar a sua avaliação.'
        ''
        '')
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 521
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 521
    inherited tb97Fundo: TToolbar97
      Left = 351
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 184
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 453
    Top = 28
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 453
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 318
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 453
    Top = 1
  end
end

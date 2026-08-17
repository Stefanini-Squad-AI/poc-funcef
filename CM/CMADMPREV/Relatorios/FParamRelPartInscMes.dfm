inherited frmParamRelPartInscMes: TfrmParamRelPartInscMes
  Left = 188
  Top = 160
  Caption = 'Parâmetro do Relatório de Participantes Inscritos no Mês'
  ClientHeight = 315
  ClientWidth = 434
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 276
    object GroupBox1: TGroupBox
      Left = 15
      Top = 16
      Width = 181
      Height = 49
      Caption = 'Mês e Ano de Referência'
      TabOrder = 0
      object dbseano: TwwDBSpinEdit
        Left = 117
        Top = 18
        Width = 52
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmes: TComboBox
        Left = 6
        Top = 18
        Width = 88
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cbmes'
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object GroupBox2: TGroupBox
      Left = 14
      Top = 73
      Width = 400
      Height = 185
      Caption = 'Patrocinadora'
      TabOrder = 1
      object chklstPatro: TCheckListBox
        Left = 6
        Top = 21
        Width = 387
        Height = 147
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 264
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      DockPos = 96
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM PESSOA'
      
        'WHERE IDPESSOA IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO =' +
        ' :IDFUNDACAO)'
      'ORDER BY'
      'NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 214
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end

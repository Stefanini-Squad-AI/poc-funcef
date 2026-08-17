inherited frmParamRelPartDeb: TfrmParamRelPartDeb
  Left = 291
  Top = 89
  Caption = 'Parâmetro do Relatório de Participantes em Débito'
  ClientHeight = 443
  ClientWidth = 428
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 404
    object GroupBox1: TGroupBox
      Left = 10
      Top = 8
      Width = 191
      Height = 49
      Caption = ' Mês/Ano Cobrança Início '
      TabOrder = 0
      object dbseanoInicial: TwwDBSpinEdit
        Left = 133
        Top = 18
        Width = 52
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmesInicial: TComboBox
        Left = 6
        Top = 18
        Width = 115
        Height = 21
        ItemHeight = 13
        TabOrder = 0
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
      Left = 9
      Top = 110
      Width = 400
      Height = 146
      Caption = 'Patrocinadora'
      TabOrder = 2
      object chklstPatro: TCheckListBox
        Left = 6
        Top = 15
        Width = 387
        Height = 121
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
    object GroupBox3: TGroupBox
      Left = 9
      Top = 256
      Width = 400
      Height = 145
      Caption = 'Situação do Participante no Plano'
      TabOrder = 3
      object chklstSitPlan: TCheckListBox
        Left = 6
        Top = 16
        Width = 387
        Height = 121
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
    object GroupBox4: TGroupBox
      Left = 10
      Top = 58
      Width = 399
      Height = 49
      Caption = ' Contribuição '
      TabOrder = 1
      object dbcContribuicao: TwwDBLookupCombo
        Left = 8
        Top = 18
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Contribuição'#9'F')
        LookupTable = qryContrib
        LookupField = 'NOME'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox5: TGroupBox
      Left = 216
      Top = 8
      Width = 191
      Height = 49
      Caption = ' Mês/Ano Cobrança Final '
      TabOrder = 4
      object dbseanoFinal: TwwDBSpinEdit
        Left = 133
        Top = 18
        Width = 52
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmesFinal: TComboBox
        Left = 6
        Top = 18
        Width = 115
        Height = 21
        ItemHeight = 13
        TabOrder = 0
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
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 355
    Top = 283
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.IDPESSOA, PJ.NOME'
      'FROM PESSOA PJ'
      
        'WHERE (PJ.IDPESSOA  IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDA' +
        'CAO = :IDFUNDACAO))'
      'ORDER BY PJ.NOME'
      ' ')
    ValidateWithMask = True
    Left = 33
    Top = 133
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOPREV, DESCRICAO'
      'FROM SITPLANOPREV'
      'ORDER BY DESCRICAO'
      ''
      '')
    ValidateWithMask = True
    Left = 33
    Top = 280
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, NOME'
      'FROM CONTRIBUICAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 352
    Top = 133
  end
end

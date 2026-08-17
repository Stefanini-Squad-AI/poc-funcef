inherited frmParamRelEncPIDPIA: TfrmParamRelEncPIDPIA
  Left = 174
  Top = 132
  Caption = 'Parâmetro de Relatório de Encerramento de PID/PIA'
  ClientHeight = 383
  ClientWidth = 395
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 344
    object GroupBox1: TGroupBox
      Left = 15
      Top = 16
      Width = 178
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
      Top = 143
      Width = 369
      Height = 185
      Caption = 'Patrocinadora'
      TabOrder = 1
      object chklstPatro: TCheckListBox
        Left = 6
        Top = 21
        Width = 357
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
    object GroupBox3: TGroupBox
      Left = 16
      Top = 72
      Width = 365
      Height = 65
      Caption = 'Tipo de Incentivo'
      TabOrder = 2
      object dblkpPlanInc: TCMDBLookupCombo
        Left = 6
        Top = 24
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryPlanInc
        LookupField = 'IDSITFUNC'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 344
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 225
      DockPos = 225
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 57
      DockPos = 57
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 371
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
    Left = 185
    Top = 229
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanInc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDSITFUNC , DESCRICAO'
      'FROM SITFUNC '
      'WHERE TIPOSIT = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 176
    Top = 88
  end
end

inherited frmExecDesfazDiarioMT: TfrmExecDesfazDiarioMT
  Left = 280
  Top = 245
  HelpContext = 1350022
  Caption = 'Desfaz Encerramento Mês - Contabilização Diária'
  ClientHeight = 193
  ClientWidth = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 467
    Height = 154
    object Label5: TLabel
      Left = 32
      Top = 32
      Width = 135
      Height = 13
      Caption = 'Competência (mês/ano)'
    end
    object Label2: TLabel
      Left = 53
      Top = 80
      Width = 399
      Height = 25
      AutoSize = False
      Caption = 
        'Exclui todos os lançamentos do mês selecionado, incluindo planil' +
        'has,  não levando em conta a periodicidade das receitas/despesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      OnClick = Label2Click
    end
    object cboMes: TwwDBComboBox
      Left = 32
      Top = 46
      Width = 169
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'MESCOMPETENCIA'
      DropDownCount = 8
      Enabled = False
      ItemHeight = 0
      Items.Strings = (
        'Janeiro'#9'1'
        'Fevereiro'#9'2'
        'Março'#9'3'
        'Abril'#9'4'
        'Maio'#9'5'
        'Junho'#9'6'
        'Julho'#9'7'
        'Agosto'#9'8'
        'Setembro'#9'9'
        'Outubro'#9'10'
        'Novembro'#9'11'
        'Dezembro'#9'12')
      Sorted = False
      TabOrder = 0
      UnboundDataType = wwDefault
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 208
      Top = 46
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'ANOCOMPETENCIA'
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object chkPlanilha: TCheckBox
      Left = 32
      Top = 80
      Width = 17
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 467
    inherited tb97Fundo: TToolbar97
      Left = 295
      DockPos = 359
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 126
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
end

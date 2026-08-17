inherited frmParamCadDependente: TfrmParamCadDependente
  Left = 156
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relação / Declaração de Dependentes'
  ClientHeight = 431
  ClientWidth = 487
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 487
    Height = 392
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 11
      Top = 7
      Width = 465
      Height = 44
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 8
        Top = 14
        Width = 449
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxFunc: TGroupBox
      Left = 12
      Top = 54
      Width = 465
      Height = 145
      Caption = 'Empregados'
      TabOrder = 1
      object pgctrlEmpregados: TPageControl
        Left = 6
        Top = 15
        Width = 453
        Height = 125
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TCheckListBox
            Left = 2
            Top = 2
            Width = 306
            Height = 92
            OnClickCheck = chklstFuncClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstFuncDrawItem
            OnKeyDown = chklstFuncKeyDown
          end
          object bbtnInverteSel: TBitBtn
            Left = 312
            Top = 29
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnInverteSelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnSelTodos: TBitBtn
            Left = 312
            Top = 2
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnSelTodosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object tbshFiltroFunc: TTabSheet
          Caption = '&Tipos / Situações / Sexo'
          object gbxTipContra: TGroupBox
            Left = 5
            Top = 1
            Width = 220
            Height = 90
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Contrato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnEnter = gbxTipContraEnter
            OnExit = gbxTipContraExit
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 17
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 35
              Width = 90
              Height = 13
              Caption = 'Efet. Especiais'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 52
              Width = 85
              Height = 13
              Caption = 'Temporários'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 69
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 113
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Terceiros'
              TabOrder = 4
            end
            object cbxPropDirSemVinc: TCheckBox
              Left = 113
              Top = 35
              Width = 97
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 113
              Top = 52
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              TabOrder = 6
            end
          end
          object gbxSituacao: TGroupBox
            Left = 232
            Top = 20
            Width = 111
            Height = 57
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Situação Funcional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnEnter = gbxSituacaoEnter
            OnExit = gbxSituacaoExit
            object cbxAtivos: TCheckBox
              Left = 9
              Top = 17
              Width = 52
              Height = 13
              Caption = 'Ativos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxAfastados: TCheckBox
              Left = 9
              Top = 36
              Width = 69
              Height = 13
              Caption = 'Afastados'
              TabOrder = 1
            end
          end
          object gbxSexoFunc: TGroupBox
            Left = 351
            Top = 20
            Width = 85
            Height = 57
            Caption = 'Sexo'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            object cbxMascFunc: TCheckBox
              Left = 9
              Top = 17
              Width = 72
              Height = 14
              Caption = 'Masculino'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbxMascFuncClick
            end
            object cbxFemFunc: TCheckBox
              Left = 9
              Top = 37
              Width = 64
              Height = 15
              Caption = 'Feminino'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbxFemFuncClick
            end
          end
        end
      end
    end
    object gbxDependente: TGroupBox
      Left = 11
      Top = 202
      Width = 465
      Height = 132
      Caption = 'Dependentes'
      TabOrder = 2
      object pgctrlDepend: TPageControl
        Left = 6
        Top = 14
        Width = 453
        Height = 113
        ActivePage = tbshTipoDepend
        HotTrack = True
        TabOrder = 0
        object tbshTipoDepend: TTabSheet
          Caption = '&Tipos de Dependência'
          object chklstTipoDepend: TCheckListBox
            Left = 2
            Top = 2
            Width = 440
            Height = 81
            OnClickCheck = chklstFuncClickCheck
            Columns = 5
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstFuncDrawItem
            OnKeyDown = chklstFuncKeyDown
          end
        end
        object tbshOpcoes: TTabSheet
          Caption = '&Faixa Etária / Sexo'
          object GroupBox2: TGroupBox
            Left = 279
            Top = 10
            Width = 111
            Height = 58
            Caption = 'Sexo'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnEnter = gbxSituacaoEnter
            OnExit = gbxSituacaoExit
            object cbxMasculino: TCheckBox
              Left = 9
              Top = 17
              Width = 72
              Height = 14
              Caption = 'Masculino'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxFeminino: TCheckBox
              Left = 9
              Top = 36
              Width = 64
              Height = 15
              Caption = 'Feminino'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object gbxIdade: TGroupBox
            Left = 44
            Top = 10
            Width = 194
            Height = 58
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Faixa Etária (anos)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object Label5: TLabel
              Left = 93
              Top = 26
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object ednIda1: TSpinEdit
              Left = 16
              Top = 23
              Width = 62
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednIda1Change
            end
            object ednIda2: TSpinEdit
              Left = 115
              Top = 23
              Width = 62
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 1
              Value = 99
              OnChange = ednIda2Change
            end
          end
        end
      end
    end
    object gbxOrdem: TGroupBox
      Left = 12
      Top = 337
      Width = 230
      Height = 44
      Caption = 'Ordem de Impressão'
      TabOrder = 3
      object cmbOrderBy: TComboBox
        Left = 8
        Top = 15
        Width = 214
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Empregado'
          'Matrícula')
      end
    end
    object gbxTipoPapel: TGroupBox
      Left = 248
      Top = 337
      Width = 229
      Height = 44
      Caption = 'Tipo de Papel'
      TabOrder = 4
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 15
        Width = 213
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 487
    inherited tb97Fundo: TToolbar97
      Left = 239
      DockPos = 312
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 80
    Top = 114
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 34
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end

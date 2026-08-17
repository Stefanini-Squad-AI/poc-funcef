inherited frmCadContasOrcEmLoteMT: TfrmCadContasOrcEmLoteMT
  Left = 145
  Top = 232
  Caption = 'Cadastro de Contas Orçamentárias - '
  ClientHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 324
    object PageControl1: TPageControl
      Left = 17
      Top = 16
      Width = 537
      Height = 289
      ActivePage = TabSheet1
      HotTrack = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Inserir'
        object lblCodigoConta: TLabel
          Left = 10
          Top = 2
          Width = 96
          Height = 13
          Caption = 'A partir da conta'
        end
        object edtCodigoConta: TEdit
          Left = 10
          Top = 18
          Width = 105
          Height = 21
          TabOrder = 0
        end
        object bbtnBuscaConta: TBitBtn
          Left = 114
          Top = 18
          Width = 25
          Height = 21
          Hint = 'Procura a Conta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 54
          Width = 513
          Height = 157
          Caption = 'Regra de formação do código da nova conta'
          TabOrder = 2
          object Label5: TLabel
            Left = 15
            Top = 30
            Width = 35
            Height = 13
            Caption = 'Inicial'
          end
          object Label7: TLabel
            Left = 72
            Top = 30
            Width = 42
            Height = 13
            Caption = 'Dígitos'
          end
          object Label8: TLabel
            Left = 326
            Top = 28
            Width = 59
            Height = 13
            Caption = 'Para cada'
          end
          object Label9: TLabel
            Left = 215
            Top = 30
            Width = 88
            Height = 13
            Caption = 'Fixo/a partir de'
          end
          object sePosIni1: TwwDBSpinEdit
            Left = 15
            Top = 44
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object sePosIni2: TwwDBSpinEdit
            Left = 15
            Top = 72
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object sePosIni3: TwwDBSpinEdit
            Left = 15
            Top = 100
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object sePosIni4: TwwDBSpinEdit
            Left = 15
            Top = 128
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object sePosFim1: TwwDBSpinEdit
            Left = 72
            Top = 44
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object sePosFim2: TwwDBSpinEdit
            Left = 72
            Top = 72
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object sePosFim3: TwwDBSpinEdit
            Left = 72
            Top = 100
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object sePosFim4: TwwDBSpinEdit
            Left = 72
            Top = 128
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object edConteudo1: TEdit
            Left = 215
            Top = 44
            Width = 79
            Height = 21
            TabOrder = 8
          end
          object edConteudo2: TEdit
            Left = 215
            Top = 72
            Width = 79
            Height = 21
            TabOrder = 9
          end
          object edConteudo3: TEdit
            Left = 215
            Top = 100
            Width = 79
            Height = 21
            TabOrder = 10
          end
          object edConteudo4: TEdit
            Left = 215
            Top = 128
            Width = 79
            Height = 21
            TabOrder = 11
          end
          object CheckBox1: TCheckBox
            Left = 126
            Top = 48
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 12
          end
          object CheckBox2: TCheckBox
            Left = 126
            Top = 76
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 13
          end
          object CheckBox3: TCheckBox
            Left = 126
            Top = 104
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 14
          end
          object CheckBox4: TCheckBox
            Left = 126
            Top = 132
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 15
          end
          object dbcboTipoCalcReal: TwwDBComboBox
            Left = 324
            Top = 44
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 0
            Sorted = False
            TabOrder = 16
            UnboundDataType = wwDefault
          end
          object wwDBComboBox1: TwwDBComboBox
            Left = 324
            Top = 72
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 1
            Sorted = False
            TabOrder = 17
            UnboundDataType = wwDefault
          end
          object wwDBComboBox2: TwwDBComboBox
            Left = 324
            Top = 100
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 2
            Sorted = False
            TabOrder = 18
            UnboundDataType = wwDefault
          end
          object wwDBComboBox3: TwwDBComboBox
            Left = 324
            Top = 128
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 3
            Sorted = False
            TabOrder = 19
            UnboundDataType = wwDefault
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Alterar'
        ImageIndex = 1
        object Label2: TLabel
          Left = 10
          Top = 44
          Width = 51
          Height = 13
          Caption = 'O campo'
        end
        object Label1: TLabel
          Left = 10
          Top = 2
          Width = 96
          Height = 13
          Caption = 'A partir da conta'
        end
        object Label12: TLabel
          Left = 10
          Top = 104
          Width = 256
          Height = 13
          Caption = 'Em todas as contas com os segintes critérios'
        end
        object wwDBComboBox4: TwwDBComboBox
          Left = 9
          Top = 60
          Width = 504
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Grupo Orçamentário'#9'GO'
            'Centro de Custo'#9'CC'
            'Atividade/Projeto'#9'UN'
            'Plano Previdenciário'#9'PP'
            'Patrocinadora'#9'PT')
          ItemIndex = 0
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object Edit1: TEdit
          Left = 10
          Top = 18
          Width = 105
          Height = 21
          TabOrder = 1
        end
        object BitBtn1: TBitBtn
          Left = 114
          Top = 18
          Width = 25
          Height = 21
          Hint = 'Procura a Conta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object Panel2: TPanel
          Left = 6
          Top = 122
          Width = 500
          Height = 130
          TabOrder = 3
          object Label3: TLabel
            Left = 252
            Top = 3
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label4: TLabel
            Left = 252
            Top = 43
            Width = 100
            Height = 13
            Caption = 'Atividade/Projeto'
          end
          object Label10: TLabel
            Left = 29
            Top = 89
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label11: TLabel
            Left = 252
            Top = 86
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object CMProcuraMask1: TCMProcuraMask
            Left = 10
            Top = 7
            Width = 230
            Height = 76
            Caption = ' Grupo '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataField = 'CODGRUPOORC'
            Mensagens.EmBranco = 'Grupo não pode estar em branco'
            Mensagens.NaoExiste = 'Grupo não existe'
            Mensagens.Sintetica = 'Grupo não pode ser sintético'
            Mensagens.Analitica = 'Grupo não pode ser analítico'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            AceitaTipoConta = SoAnalitica
            LookupParam = 'CODGRUPOORC'
            LookupChave = 'CODGRUPOORC'
            LookupTipo = 'FLGANALSINT'
            LookupDescricao = 'NOMEGRUPOORCAMEN'
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 252
            Top = 18
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome'
              'CODCENTROCUSTO'#9'10'#9'Código'
              'STATUSGRUPOCDC'#9'1'#9'A/S')
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo2: TwwDBLookupCombo
            Left = 252
            Top = 58
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'UNECODIGO'#9'10'#9'Código')
            LookupField = 'UNIDNEGOC'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo3: TwwDBLookupCombo
            Left = 29
            Top = 102
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário'#9'F')
            LookupField = 'IDPLANOPREV'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo4: TwwDBLookupCombo
            Left = 252
            Top = 102
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Patrocinadora'#9'F')
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Excluir'
        ImageIndex = 2
        object Label14: TLabel
          Left = 14
          Top = 46
          Width = 239
          Height = 13
          Caption = 'Todas as contas com os segintes critérios'
        end
        object Panel1: TPanel
          Left = 14
          Top = 66
          Width = 500
          Height = 143
          TabOrder = 0
          object Label6: TLabel
            Left = 252
            Top = 3
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label13: TLabel
            Left = 252
            Top = 43
            Width = 100
            Height = 13
            Caption = 'Atividade/Projeto'
          end
          object lblPlanoPrevDes: TLabel
            Left = 29
            Top = 89
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object lblPatroDes: TLabel
            Left = 252
            Top = 86
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object dbeGrupo: TCMProcuraMask
            Left = 10
            Top = 7
            Width = 230
            Height = 76
            Caption = ' Grupo '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataField = 'CODGRUPOORC'
            Mensagens.EmBranco = 'Grupo não pode estar em branco'
            Mensagens.NaoExiste = 'Grupo não existe'
            Mensagens.Sintetica = 'Grupo não pode ser sintético'
            Mensagens.Analitica = 'Grupo não pode ser analítico'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            AceitaTipoConta = SoAnalitica
            LookupParam = 'CODGRUPOORC'
            LookupChave = 'CODGRUPOORC'
            LookupTipo = 'FLGANALSINT'
            LookupDescricao = 'NOMEGRUPOORCAMEN'
          end
          object dblkCCusto: TwwDBLookupCombo
            Left = 252
            Top = 18
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome'
              'CODCENTROCUSTO'#9'10'#9'Código'
              'STATUSGRUPOCDC'#9'1'#9'A/S')
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkAtivProj: TwwDBLookupCombo
            Left = 252
            Top = 58
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'UNECODIGO'#9'10'#9'Código')
            LookupField = 'UNIDNEGOC'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkPlanoPrev: TwwDBLookupCombo
            Left = 29
            Top = 102
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário'#9'F')
            LookupField = 'IDPLANOPREV'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkPatro: TwwDBLookupCombo
            Left = 252
            Top = 102
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Patrocinadora'#9'F')
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 324
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 547
  end
end

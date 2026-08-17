inherited frmParamCAP_GeraCalc: TfrmParamCAP_GeraCalc
  Left = 182
  Top = 148
  ActiveControl = gbxDataPag
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Contas a Pagar / Pagamento Eletrônico'
  ClientHeight = 418
  ClientWidth = 437
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 379
    BorderWidth = 2
    object pnlCAP: TPanel
      Left = 10
      Top = 128
      Width = 416
      Height = 168
      TabOrder = 5
      object pnlOpcoesCAP: TPanel
        Left = 8
        Top = 12
        Width = 401
        Height = 45
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Locked = True
        ParentColor = True
        TabOrder = 0
        object chkRateioCC: TCheckBox
          Left = 8
          Top = 3
          Width = 151
          Height = 17
          Caption = 'Ratear por Centro de Custo'
          TabOrder = 0
        end
        object chkCriaDocIndividual: TCheckBox
          Left = 215
          Top = 3
          Width = 151
          Height = 17
          Caption = 'Criar Documento Individual '
          TabOrder = 1
        end
        object chkConsTipoDesemb: TCheckBox
          Left = 8
          Top = 23
          Width = 190
          Height = 17
          Caption = 'Consolidar por Tipo de Desembolso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
      object gbxTipoDesemb: TGroupBox
        Left = 8
        Top = 59
        Width = 401
        Height = 103
        Caption = ' Tipos de Desembolso '
        TabOrder = 1
        object chklstTipoDesemb: TColorCheckListBox
          Left = 7
          Top = 15
          Width = 246
          Height = 82
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
        end
        object bbtnSelTipo: TBitBtn
          Left = 258
          Top = 15
          Width = 135
          Height = 25
          Caption = ' Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = bbtnSelTipoClick
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
        object bbtnInvTipo: TBitBtn
          Left = 258
          Top = 41
          Width = 135
          Height = 25
          Caption = ' Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = bbtnInvTipoClick
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
      end
    end
    object pnlPagEletronico: TPanel
      Left = 10
      Top = 57
      Width = 416
      Height = 63
      TabOrder = 3
      object Label4: TLabel
        Left = 13
        Top = 13
        Width = 27
        Height = 13
        Caption = 'Pasta'
      end
      object edPastaArqPag: TEdit
        Left = 13
        Top = 27
        Width = 357
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
        Text = 'C:\'
      end
      object bbtnSelPastaPag: TBitBtn
        Left = 374
        Top = 25
        Width = 26
        Height = 25
        TabOrder = 1
        OnClick = bbtnSelPastaPagClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888800000888888888888888888800000888008888888888888800000880F
          108888888888888000008809F108888888888880000088809F00888888888880
          0000888809F0000788888880000088888090FFF0788888800000887000088888
          00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
          0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
          0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
          B088888000008870000000000788888000008888888888888888888000008888
          88888888888888800000}
      end
    end
    object gbxDataPag: TGroupBox
      Left = 10
      Top = 6
      Width = 95
      Height = 43
      Caption = ' Pagamento em '
      TabOrder = 0
      object dtDataPag: TCMDateTimePicker
        Left = 7
        Top = 14
        Width = 81
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
      end
    end
    object gbxPortForma: TGroupBox
      Left = 111
      Top = 6
      Width = 315
      Height = 43
      Caption = ' Portador Forma '
      TabOrder = 1
      object dblckPortadorForma: TwwDBLookupCombo
        Left = 7
        Top = 14
        Width = 301
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = CdsPortadorForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object chkPagEletronico: TCheckBox
      Left = 25
      Top = 50
      Width = 180
      Height = 17
      Caption = 'Arquivo de Pagamento Eletrônico'
      TabOrder = 2
      OnClick = chkPagEletronicoClick
    end
    object chkCAP: TCheckBox
      Left = 25
      Top = 121
      Width = 175
      Height = 17
      Caption = 'Autorização de Pagamento (AP)'
      TabOrder = 4
      OnClick = chkCAPClick
    end
    object CMProcuraMaskContabil: TCMProcuraMaskContabil
      Left = 10
      Top = 299
      Width = 416
      Height = 75
      Caption = ' Conta Contábil Padrão para (Novos) Favorecidos '
      TabOrder = 6
      MostraMensagens = True
      MostraDescricao = True
      DataField = 'CONTA'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintética'
      Mensagens.Analitica = 'Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = True
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scSoAtiva
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 265
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 193
  end
  object CdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 210
    Top = 193
  end
  object ProcuraDirDlg: TProcuraDirDlg
    Caption = 'Selecionar Pasta'
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    Options = [bfStatusText, bfBrowseForComputer]
    ShowPath = True
    Title = 
      'Selecione a Pasta que irá conter o Arquivo de Pagamento Eletrôni' +
      'co gerado.'
    Left = 105
    Top = 193
  end
  object dsAux: TDataSource
    DataSet = CdsAux
    Left = 70
    Top = 239
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT LPAD('#39'1'#39',18,'#39'1'#39') AS CONTA FROM DUAL WHERE (1=2)')
    ClientDataSet = CdsAux
    Left = 103
    Top = 239
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 139
    Top = 239
  end
end

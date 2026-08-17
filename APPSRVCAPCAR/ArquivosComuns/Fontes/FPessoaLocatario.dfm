inherited frmPessoaLocatario: TfrmPessoaLocatario
  Left = -4
  Top = -4
  HelpContext = 640036
  Caption = 'Cadastro de Compradores / Locatários'
  ClientHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Height = 460
    BevelInner = bvNone
    BorderWidth = 0
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 1
      Top = 106
      Width = 802
      Height = 353
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados do Cliente')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        Top = 53
        Width = 708
        Height = 296
        ActivePage = tbsCliente
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 700
            Height = 268
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 700
            Height = 268
            inherited pnlItemsDoc: TPanel
              Height = 266
            end
            inherited pnlFoto: TPanel
              Width = 210
              Height = 266
              inherited Bevel1: TBevel
                Height = 235
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 235
                Width = 210
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 208
                Height = 235
              end
            end
            inherited lstDocumentos: TListView
              Height = 266
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 700
            Height = 268
            inherited lblPdLocal: TLabel
              Left = 16
              Top = 8
            end
            inherited lblPdLogradouro: TLabel
              Left = 16
              Top = 48
            end
            inherited lblPdComplemento: TLabel
              Left = 16
              Top = 88
            end
            inherited lblPdCidade: TLabel
              Left = 16
              Top = 128
            end
            inherited lblPdEstado: TLabel
              Left = 16
              Top = 168
            end
            inherited lblPdNumero: TLabel
              Left = 392
              Top = 48
            end
            inherited lblPdCEP: TLabel
              Left = 416
              Top = 88
            end
            inherited lblBairro: TLabel
              Left = 248
              Top = 88
            end
            inherited lblPdPais: TLabel
              Left = 264
              Top = 168
            end
            inherited dbedNomeEndereco: TDBEdit
              Left = 16
              Top = 24
              Width = 473
              TabOrder = 1
            end
            inherited dbedLogradouro: TDBEdit
              Left = 16
              Top = 64
              Width = 361
              TabOrder = 2
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              Left = 16
              Top = 104
              Width = 217
              TabOrder = 4
            end
            inherited dbedEstado: TwwDBEdit
              Left = 16
              Top = 184
              Width = 233
              TabOrder = 7
            end
            inherited dbedBairro: TwwDBEdit
              Left = 248
              Top = 104
              Width = 153
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              Left = 392
              Top = 64
              Width = 97
              TabOrder = 3
            end
            inherited dbedCEP: TwwDBEdit
              Left = 416
              Top = 104
              Width = 73
              TabOrder = 6
            end
            inherited dbedPais: TwwDBEdit
              Left = 264
              Top = 184
              Width = 225
              TabOrder = 8
            end
            inherited cmbCidade: TCMDBLookupCombo
              Width = 474
              TabOrder = 9
            end
            inherited grpTipoEnd: TGroupBox
              Left = 523
              Width = 177
              Height = 268
              TabOrder = 10
            end
            object wwDBComboBox1: TwwDBComboBox
              Left = 16
              Top = 24
              Width = 473
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'NOME'
              DataSource = dsEndereco
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Filial'
                'Filial - Cobrança'
                'Matriz'
                'Matriz - Cobrança')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 700
            Height = 268
            Selected.Strings = (
              'LOGRADOURO'#9'20'#9'Logradouro'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'10'#9'Complemento'
              'BAIRRO'#9'10'#9'Bairro'
              'CEP'#9'10'#9'CEP'
              'NOMECIDADE'#9'20'#9'Cidade'
              'NOMEESTADO'#9'20'#9'Estado'
              'NOMEPAIS'#9'20'#9'Pais'
              'NOME'#9'20'#9'Local')
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 700
            Height = 268
          end
          inherited Panel1: TPanel
            Width = 700
            Height = 268
            inherited lblDDI: TLabel
              Left = 16
            end
            inherited lblDDD: TLabel
              Left = 72
            end
            inherited DBEDDDI: TDBEdit
              Left = 16
              Width = 41
            end
            inherited DBEDDDD: TDBEdit
              Left = 72
              Width = 41
            end
            inherited GroupBox4: TGroupBox
              Left = 16
              Top = 56
              Width = 233
              Height = 105
              Caption = ' Tipo de Telefone '
            end
            inherited GroupBox5: TGroupBox
              Top = 8
              Height = 153
              Caption = ' Contatos '
              inherited dbgTelefoneRamal: TwwDBGrid
                Left = 16
                Width = 241
                Height = 98
              end
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 700
            Height = 268
            inherited mnbm: TLabel
              Left = 16
              Top = 96
            end
            inherited lblNasc: TLabel
              Left = 208
              Top = 48
            end
            inherited lblObs: TLabel
              Left = 16
              Top = 144
            end
            inherited dbedcontatoemail: TDBEdit
              Left = 16
              Top = 64
            end
            inherited DBEdit2: TDBEdit
              Left = 16
            end
            inherited DBEdit3: TDBEdit
              Left = 208
            end
            inherited GroupBox6: TGroupBox
              Left = 352
              Top = 8
              Height = 169
              inherited dbgContatoRamal: TwwDBGrid
                Left = 16
                Width = 161
              end
            end
            inherited dblcTelefone: TCMDBLookupCombo
              Left = 392
              Top = 96
            end
            inherited DBMemo1: TDBMemo
              Left = 16
              Top = 160
            end
            inherited dbedContatoNome: TDBEdit
              Left = 16
              Top = 24
            end
          end
          inherited dbgContato: TwwDBGrid
            Width = 700
            Height = 268
          end
        end
        object tbsCliente: TTabSheet
          Caption = 'Dados do Cliente'
          object Label14: TLabel
            Left = 16
            Top = 10
            Width = 87
            Height = 13
            Caption = 'Tipo do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSubConta: TLabel
            Left = 280
            Top = 10
            Width = 122
            Height = 13
            Caption = 'Sub-Conta Associada'
          end
          object DBcboTipoCliente: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 249
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO')
            LookupTable = qryTipoCliente
            LookupField = 'IDTIPOCLIENTE'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBcboSubConta: TwwDBLookupCombo
            Left = 280
            Top = 24
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No')
            DataField = 'CODSUBCONTA'
            DataSource = dsSubTipo
            LookupTable = qrySubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 794
        Height = 29
        inherited tb97BotoesDetalhe: TToolbar97
          BorderStyle = bsNone
          inherited sbtnInsDet: TToolbarButton97
            Width = 77
            Height = 23
            Caption = 'In&serir'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
          end
          inherited sbtnAltDet: TToolbarButton97
            Left = 77
            Width = 77
            Height = 23
            Caption = 'Alte&rar'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
              77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
              7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
              077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
              F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
              FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
              077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
              FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
              777777777787FF88777777777778887777777777777888777777}
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 154
            Width = 77
            Height = 23
            Caption = 'E&xcluir'
          end
        end
        inherited tb97TituloDetalhe: TToolbar97
          Left = 235
          DockPos = 235
          inherited dbedPaiDetalhe: TwwDBEdit
            Top = 0
            Width = 520
          end
        end
      end
      inherited Dock974: TDock97
        Left = 712
        Top = 53
        Width = 86
        Height = 296
        inherited tb97Detalhe: TToolbar97
          BorderStyle = bsNone
          inherited bbtnOkDet: TBitBtn
            Width = 81
            Height = 25
            Caption = 'Ok'
            Margin = 4
          end
          inherited bbtnCancelarDet: TBitBtn
            Top = 25
            Width = 81
            Height = 25
            Margin = 4
          end
          inherited bbtnVoltarDet: TBitBtn
            Top = 50
            Width = 81
            Height = 25
            Enabled = False
            Visible = False
            Margin = 4
          end
        end
      end
    end
    inherited pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 802
      BevelOuter = bvNone
      inherited lblNome: TLabel
        Left = 160
        Top = 10
      end
      inherited LabelRAZAOSOCIAL: TLabel
        Top = 50
      end
      inherited lblEMail: TLabel
        Left = 440
        Top = 10
      end
      inherited lblPdGrupo: TLabel
        Left = 456
        Top = 50
      end
      inherited SpeedButton1: TSpeedButton
        Left = 748
        Top = 62
        Width = 25
        Height = 25
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 584
        Top = 10
      end
      inherited dbedNomeFantasia: TDBEdit
        Left = 160
        Top = 24
        Width = 265
      end
      inherited dbedDocumento: TwwDBEdit
        Top = 24
      end
      inherited dbedRazaoSocial: TDBEdit
        Top = 64
      end
      inherited dbedemail: TwwDBEdit
        Left = 440
        Top = 24
      end
      inherited edDBGrupo: TwwDBEdit
        Left = 456
        Top = 64
        Width = 292
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 584
        Top = 24
      end
    end
  end
  inherited Dock972: TDock97
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 89
        Height = 29
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
          8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
          BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
          B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
          B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
          0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
          FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
          BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
          88B888888888888888888888888B888888888888888888888888}
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 89
        Width = 89
        Height = 29
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
          77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
          7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
          077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
          F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
          FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
          077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
          FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
          777777777787FF88777777777778887777777777777888777777}
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 267
        Width = 89
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 178
        Width = 89
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnFisJur: TToolbarButton97
        Left = 356
        Width = 129
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
        Visible = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 495
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 619
      DockPos = 619
      inherited sep1: TToolbarSep97
        Left = 83
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 0
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
        Width = 81
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
        Width = 81
        Height = 27
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 0
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 2
        Width = 81
        Height = 27
      end
      inherited bbtnCancelar: TBitBtn
        Left = 85
        Width = 81
        Height = 27
      end
    end
  end
  inherited qry: TwwQuery
    Left = 33
    Top = 243
  end
  inherited dsDet: TwwDataSource
    Left = 626
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65497
    Top = 65497
  end
  inherited upd: TUpdateSQL
    Left = 462
    Top = 179
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'LOCATARIO')
    CamposChave.Strings = (
      'LOCATARIO.IDLOCATARIO')
    Filtro.Strings = (
      'LOCATARIO.IDLOCATARIO = PESSOA.IDPESSOA')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    ExibePergunta = False
    Left = 515
  end
  inherited ds: TwwDataSource
    Left = 744
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update LOCATARIO'
      'set'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDLOCATARIO = :OLD_IDLOCATARIO')
    InsertSQL.Strings = (
      'insert into LOCATARIO'
      '  (IDLOCATARIO, CODSUBCONTA, IDPESSOA)'
      'values'
      '  (:IDLOCATARIO, :CODSUBCONTA, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from LOCATARIO'
      'where'
      '  IDLOCATARIO = :OLD_IDLOCATARIO')
    Left = 524
    Top = 173
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT '
      '   IDLOCATARIO, CODSUBCONTA, IDPESSOA'
      'FROM '
      '   LOCATARIO '
      'WHERE  '
      '   ( IDLOCATARIO =:IdPessoa )')
    Left = 185
    Top = 412
    object qrySubTipoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'LOCATARIO.IDLOCATARIO'
    end
    object qrySubTipoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'LOCATARIO.CODSUBCONTA'
    end
    object qrySubTipoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LOCATARIO.IDPESSOA'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 641
    Top = 220
  end
  inherited dsPessoaFisica: TwwDataSource
    Top = 49
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 401
    Top = 230
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 233
    Top = 348
  end
  inherited ImageList1: TImageList
    Left = 400
    Top = 60
  end
  inherited qryTelefone: TwwQuery
    Left = 103
    Top = 412
  end
  inherited updTelefone: TUpdateSQL
    Left = 462
    Top = 332
  end
  inherited dsTelefone: TwwDataSource
    Left = 683
    Top = 164
  end
  inherited dsEndereco: TwwDataSource
    Left = 746
    Top = 100
  end
  inherited updEndereco: TUpdateSQL
    Left = 399
    Top = 284
  end
  inherited qryEndereco: TwwQuery
    Left = 34
    Top = 420
    inherited qryEnderecoLOGRADOURO: TStringField [0]
    end
    inherited qryEnderecoTIPOEND_PADRAO: TStringField [1]
    end
    inherited qryEnderecoNUMERO: TStringField [2]
    end
    inherited qryEnderecoCOMPLEMENTO: TStringField [3]
    end
    inherited qryEnderecoBAIRRO: TStringField [4]
    end
    inherited qryEnderecoCEP: TStringField [5]
      EditMask = '99999-999;0; '
    end
    inherited qryEnderecoNOMECIDADE: TStringField [6]
    end
    inherited qryEnderecoNOMEESTADO: TStringField [7]
    end
    inherited qryEnderecoNOME: TStringField [8]
    end
    inherited qryEnderecoCIDADE: TStringField [9]
    end
    inherited qryEnderecoIDPESSOA: TFloatField [10]
    end
    inherited qryEnderecoIDENDERECO: TFloatField [11]
    end
    inherited qryEnderecoIDCIDADES: TFloatField [12]
    end
    inherited qryEnderecoNOMEPAIS: TStringField [13]
    end
  end
  inherited qryContato: TwwQuery
    Left = 236
    Top = 236
  end
  inherited updContato: TUpdateSQL
    Left = 481
    Top = 284
  end
  inherited dsContato: TwwDataSource
    Left = 748
    Top = 164
  end
  inherited qryRamal: TwwQuery
    Left = 31
    Top = 292
  end
  inherited updRamal: TUpdateSQL
    Left = 520
    Top = 228
  end
  inherited dsRamal: TwwDataSource
    Left = 690
    Top = 2
  end
  inherited qryDocumento: TwwQuery
    Left = 102
    Top = 236
  end
  inherited dsDocumento: TwwDataSource
    Left = 620
    Top = 164
  end
  inherited updDocumento: TUpdateSQL
    Left = 398
    Top = 332
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 142
    Top = 351
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 614
    Top = 64
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpOpcional
    SubTipo = stLocatario
    FormCaption = 'Cadastro de Compradores / Locatários'
    Left = 288
    Top = 59
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 334
    Top = 60
  end
  inherited qryImagem: TwwQuery
    Left = 223
    Top = 292
  end
  inherited updImagem: TUpdateSQL
    Left = 400
    Top = 180
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 460
    Top = 236
  end
  inherited qryImagensDoc: TwwQuery
    Left = 128
    Top = 236
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 683
    Top = 60
  end
  inherited qryTipoDoc: TwwQuery
    Left = 57
    Top = 292
  end
  inherited MSGrupo: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      ''
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    Left = 522
    Top = 48
  end
  inherited qryEstado: TwwQuery
    Left = 137
    Top = 292
  end
  inherited qryCidade: TwwQuery
    Left = 153
    Top = 236
  end
  inherited dsCidade: TwwDataSource
    Left = 693
    Top = 108
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 33
    Top = 357
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 615
    Top = 116
  end
  object qryPreencheCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.DESCRICAO AS TIPOCLIENTE'
      'FROM'
      '   TIPOCLIENTE T, CLIENTEPESS C'
      'WHERE'
      '   ( C.IDPESSOA =:CLIENTE )'
      '   AND'
      '   ( C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+) )')
    ValidateWithMask = True
    Left = 288
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLIENTE'
        ParamType = ptUnknown
      end>
    object qryPreencheClienteTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      Size = 40
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 288
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object qryTipoCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCLIENTE, DESCRICAO'
      'FROM'
      '   TIPOCLIENTE'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 288
    Top = 384
    object qryTipoClienteDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object qryTipoClienteIDTIPOCLIENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
      Visible = False
    end
  end
end

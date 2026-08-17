inherited frmPessoaSeguradora: TfrmPessoaSeguradora
  Left = -4
  Top = -4
  Caption = 'Seguradora'
  ClientHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Height = 460
    BevelInner = bvNone
    BorderWidth = 0
    inherited pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 798
      BevelOuter = bvNone
      inherited lblNome: TLabel
        Left = 160
        Top = 10
      end
      inherited LabelRAZAOSOCIAL: TLabel
        Top = 50
      end
      inherited lblEMail: TLabel
        Left = 456
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
        Left = 600
        Top = 10
      end
      inherited dbedNomeFantasia: TDBEdit
        Left = 160
        Top = 24
        Width = 281
      end
      inherited dbedDocumento: TwwDBEdit
        Top = 24
      end
      inherited dbedRazaoSocial: TDBEdit
        Top = 64
      end
      inherited dbedemail: TwwDBEdit
        Left = 456
        Top = 24
      end
      inherited edDBGrupo: TwwDBEdit
        Left = 456
        Top = 64
        Width = 292
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 600
        Top = 24
        Width = 173
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 1
      Top = 106
      Width = 798
      Height = 353
      inherited pgctrlDetalhe: TPageControl
        Top = 53
        Width = 704
        Height = 296
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 696
            Height = 268
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 696
            Height = 268
            inherited pnlItemsDoc: TPanel
              Height = 266
            end
            inherited pnlFoto: TPanel
              Width = 206
              Height = 266
              inherited Bevel1: TBevel
                Height = 235
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 235
                Width = 206
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 204
                Height = 235
              end
            end
            inherited lstDocumentos: TListView
              Height = 266
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 696
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
          inherited pnlControlesDet: TPanel
            Width = 696
            Height = 268
            inherited dbedNomeEndereco: TDBEdit
              TabOrder = 1
            end
            inherited dbedLogradouro: TDBEdit
              TabOrder = 2
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              TabOrder = 4
            end
            inherited dbedEstado: TwwDBEdit
              TabOrder = 7
            end
            inherited dbedBairro: TwwDBEdit
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              TabOrder = 3
            end
            inherited dbedCEP: TwwDBEdit
              TabOrder = 6
            end
            inherited dbedPais: TwwDBEdit
              TabOrder = 8
            end
            inherited cmbCidade: TCMDBLookupCombo
              TabOrder = 9
            end
            inherited grpTipoEnd: TGroupBox
              Left = 499
              Height = 268
              TabOrder = 10
            end
            object wwDBComboBox1: TwwDBComboBox
              Left = 14
              Top = 19
              Width = 459
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
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Width = 696
            Height = 268
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 696
            Height = 268
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 696
            Height = 268
          end
          inherited dbgContato: TwwDBGrid
            Width = 696
            Height = 268
          end
        end
      end
      inherited Dock973: TDock97
        Width = 790
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
        Left = 708
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
            Spacing = 4
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
        Left = 0
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 166
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
        Width = 81
        Height = 27
        Caption = 'Sair'
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
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 2
        Width = 81
        Height = 27
        Caption = 'Ok'
      end
      inherited bbtnCancelar: TBitBtn
        Left = 85
        Width = 81
        Height = 27
        Caption = 'Cancelar'
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      ' PESSOA.IDPESSOA ,'
      ' PESSOA.IDIMAGEM,'
      ' PESSOA.NOME ,'
      ' PESSOA.TIPO ,'
      ' PESSOA.RAZAOSOCIAL ,'
      ' PESSOA.NUMDOCUMENTO ,'
      ' PESSOA.IDDOCUMENTO ,'
      ' PESSOA.EMAIL ,'
      ' PESSOA.IDGRUPO,'
      ' PESSOA.IDENDCOMERCIAL,'
      ' PESSOA.IDENDRESIDENCIAL,'
      ' PESSOA.IDENDENTREGA,'
      ' PESSOA.IDENDCOBRANCA,'
      ' PESSOA.IDENDCORRESP,'
      ' G.NOME AS NOMEGRUPO,'
      ' PESSOA.HOMEPAGE,'
      ' PESSOA.IDMODULORESPON,'
      ' MODULO.NOMEMODULO'
      ''
      'FROM PESSOA, PESSOA g, MODULO'
      'WHERE ( PESSOA.IDPESSOA =:IdPessoa )  AND'
      '      ( G.IDPESSOA(+) = PESSOA.IDGRUPO ) AND'
      '      ( MODULO.IDMODULO(+) = PESSOA.IDMODULORESPON )'
      ' '
      ' '
      ' ')
    Left = 25
    Top = 243
  end
  inherited dsDet: TwwDataSource
    Left = 754
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65500
    Top = 65499
  end
  inherited upd: TUpdateSQL
    Left = 358
    Top = 163
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
      'SEGURADORA')
    CamposChave.Strings = (
      'SEGURADORA.IDSEGURADORA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = SEGURADORA.IDSEGURADORA')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    Left = 515
  end
  inherited ds: TwwDataSource
    Left = 704
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update SEGURADORA'
      'set'
      '  IDSEGURADORA = :IDSEGURADORA'
      'where'
      '  IDSEGURADORA = :OLD_IDSEGURADORA')
    InsertSQL.Strings = (
      'insert into SEGURADORA'
      '  (IDSEGURADORA)'
      'values'
      '  (:IDSEGURADORA)')
    DeleteSQL.Strings = (
      'delete from SEGURADORA'
      'where'
      '  IDSEGURADORA = :OLD_IDSEGURADORA')
    Left = 356
    Top = 268
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT SEGURADORA.IDSEGURADORA'
      'FROM SEGURADORA'
      'WHERE ( SEGURADORA.IDSEGURADORA =:IdPessoa )')
    Left = 89
    Top = 244
    object qrySubTipoIDSEGURADORA: TFloatField
      FieldName = 'IDSEGURADORA'
      Origin = 'SEGURADORA.IDSEGURADORA'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 737
    Top = 148
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 649
    Top = 1
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 481
    Top = 158
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 409
    Top = 164
  end
  inherited ImageList1: TImageList
    Left = 344
    Top = 92
  end
  inherited qryTelefone: TwwQuery
    Left = 239
    Top = 244
  end
  inherited updTelefone: TUpdateSQL
    Left = 358
    Top = 220
  end
  inherited dsTelefone: TwwDataSource
    Left = 707
    Top = 52
  end
  inherited dsEndereco: TwwDataSource
    Top = 196
  end
  inherited updEndereco: TUpdateSQL
    Left = 487
    Top = 268
  end
  inherited qryEndereco: TwwQuery
    Left = 26
    Top = 300
    inherited qryEnderecoLOGRADOURO: TStringField [0]
      DisplayLabel = 'Logradouro'
      DisplayWidth = 20
    end
    inherited qryEnderecoCEP: TStringField
      EditMask = '99999-999;0;'
    end
    inherited qryEnderecoNOME: TStringField [12]
    end
  end
  inherited qryContato: TwwQuery
    Left = 164
    Top = 300
  end
  inherited updContato: TUpdateSQL
    Left = 353
    Top = 324
  end
  inherited dsContato: TwwDataSource
    Left = 644
    Top = 244
  end
  inherited qryRamal: TwwQuery
    Left = 239
    Top = 292
  end
  inherited updRamal: TUpdateSQL
    Left = 424
    Top = 268
  end
  inherited dsRamal: TwwDataSource
    Left = 645
    Top = 300
  end
  inherited qryDocumento: TwwQuery
    Top = 300
  end
  inherited dsDocumento: TwwDataSource
    Left = 708
    Top = 108
  end
  inherited updDocumento: TUpdateSQL
    Left = 486
    Top = 212
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 123
    Top = 404
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 643
    Top = 100
  end
  inherited Pessoa: TPessoa
    SubTipo = stSeguradora
    Left = 299
    Top = 51
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 414
    Top = 52
  end
  inherited qryImagem: TwwQuery
    Left = 239
    Top = 348
  end
  inherited updImagem: TUpdateSQL
    Left = 464
    Top = 332
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 428
    Top = 220
  end
  inherited qryImagensDoc: TwwQuery
    Left = 24
    Top = 348
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 755
    Top = 60
  end
  inherited qryTipoDoc: TwwQuery
    Left = 161
    Top = 244
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
      'CNPJ'
      'Nome Fantasia'
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
    Left = 169
    Top = 348
  end
  inherited qryCidade: TwwQuery
    Left = 89
    Top = 348
  end
  inherited dsCidade: TwwDataSource
    Left = 645
    Top = 52
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 25
    Top = 397
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 639
    Top = 148
  end
end

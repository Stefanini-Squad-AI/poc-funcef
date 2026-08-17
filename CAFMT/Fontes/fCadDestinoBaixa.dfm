inherited frmCadDestinoBaixa: TfrmCadDestinoBaixa
  Left = -2
  Top = 39
  HelpContext = 70014
  Caption = 'Destinatários de Bens Alienados'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 180
      end
      inherited sbtnFisJur: TToolbarButton97
        Left = 337
        Visible = True
      end
      object bbtnSelResp: TToolbarButton97
        Left = 240
        Top = 0
        Width = 97
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = '&Destinatários'
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = bbtnSelRespClick
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70014
      end
    end
  end
  inherited dsDet: TwwDataSource
    Left = 514
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 756
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  EMAIL = :EMAIL,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  HOMEPAGE = :HOMEPAGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, IDIMAGEM, NOME, TIPO, RAZAOSOCIAL, NUMDOCUMENTO, ID' +
        'DOCUMENTO, '
      
        '   EMAIL, IDGRUPO, IDENDCOMERCIAL, IDENDRESIDENCIAL, IDENDENTREG' +
        'A, IDENDCOBRANCA, '
      '   IDENDCORRESP, HOMEPAGE)'
      'values'
      
        '  (:IDPESSOA, :IDIMAGEM, :NOME, :TIPO, :RAZAOSOCIAL, :NUMDOCUMEN' +
        'TO, :IDDOCUMENTO, '
      
        '   :EMAIL, :IDGRUPO, :IDENDCOMERCIAL, :IDENDRESIDENCIAL, :IDENDE' +
        'NTREGA, '
      '   :IDENDCOBRANCA, :IDENDCORRESP,:HOMEPAGE)')
    Left = 702
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pessoa'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    Left = 587
  end
  inherited ds: TwwDataSource
    Left = 672
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update TERCEIRO'
      'set'
      '  TIPOTERCEIRO = :TIPOTERCEIRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  TIPOTERCEIRO = :OLD_TIPOTERCEIRO')
    InsertSQL.Strings = (
      'insert into TERCEIRO'
      '  (IDPESSOA, TIPOTERCEIRO)'
      'values'
      '  (:IDPESSOA, :TIPOTERCEIRO)')
    DeleteSQL.Strings = (
      'delete from TERCEIRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  TIPOTERCEIRO = :OLD_TIPOTERCEIRO')
    Left = 580
    Top = 156
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA, TIPOTERCEIRO'
      'FROM TERCEIRO'
      'WHERE (IDPESSOA = :IDPESSOA)')
    Left = 465
    Top = 156
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubTipoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TERCEIRO.IDPESSOA'
    end
    object qrySubTipoTIPOTERCEIRO: TFloatField
      FieldName = 'TIPOTERCEIRO'
      Origin = 'TERCEIRO.TIPOTERCEIRO'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 521
    Top = 156
  end
  inherited dsDocumento: TwwDataSource
    Left = 276
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpOpcional
    SubTipo = stTerceiro
    FormCaption = 'Destinatários de Bens Alienados'
    UsaPessoaFisica = True
    Left = 300
    Top = 8
  end
  inherited MSGrupo: TMontaSelect
    Left = 706
  end
  object MSTerceiros: TMontaSelect [50]
    Template.IdConsulta = 0
    Caption = 'Seleciona Destinatário de Bens Alienados'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Destinatário')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TERCEIRO'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'TERCEIRO.IDPESSOA=PESSOA.IDPESSOA'
      'TERCEIRO.TIPOTERCEIRO=1')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 704
    Top = 56
  end
end

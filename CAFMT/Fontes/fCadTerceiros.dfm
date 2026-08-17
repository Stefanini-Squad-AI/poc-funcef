inherited frmCadTerceiros: TfrmCadTerceiros
  Left = -2
  Top = 39
  HelpContext = 70013
  Caption = 'Terceiros'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      inherited sbtnFisJur: TToolbarButton97
        Left = 300
      end
      object bbtnSelResp: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = '&Terceiros'
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
        HelpContext = 70013
      end
    end
  end
  inherited dsDet: TwwDataSource
    Left = 498
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 732
    Top = 65531
  end
  inherited upd: TUpdateSQL
    Left = 678
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
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
    Left = 555
  end
  inherited ds: TwwDataSource
    Left = 640
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
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TERCEIRO'
      '  (IDPESSOA, TIPOTERCEIRO)'
      'values'
      '  (:IDPESSOA, :TIPOTERCEIRO)')
    DeleteSQL.Strings = (
      'delete from TERCEIRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 588
    Top = 172
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA, TIPOTERCEIRO'
      'FROM TERCEIRO'
      'WHERE (IDPESSOA = :IDPESSOA)')
    Left = 457
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubTipoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.TERCEIRO".IDPESSOA'
    end
    object qrySubTipoTIPOTERCEIRO: TFloatField
      FieldName = 'TIPOTERCEIRO'
      Origin = '"CM.TERCEIRO".TIPOTERCEIRO'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 521
    Top = 172
  end
  inherited dsDocumento: TwwDataSource
    Left = 356
  end
  inherited Pessoa: TPessoa
    Left = 300
    Top = 8
  end
  inherited MSGrupo: TMontaSelect
    Left = 706
  end
  object MSTerceiros: TMontaSelect [50]
    Template.IdConsulta = 0
    Caption = 'Seleciona os Terceiros cadastrados'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Terceiro')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TERCEIRO'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'TERCEIRO.IDPESSOA=PESSOA.IDPESSOA'
      'TERCEIRO.TIPOTERCEIRO=0')
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

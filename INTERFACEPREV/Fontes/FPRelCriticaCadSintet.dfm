inherited frmPRelCriticaCadSintet: TfrmPRelCriticaCadSintet
  Left = 114
  Top = 56
  Caption = 'Parâmetros para as Críticas de Interface Cadastral - Sintético'
  ClientHeight = 426
  ClientWidth = 428
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 387
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 385
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object grpAnoMesReferencia: TGroupBox
        Left = 46
        Top = 58
        Width = 323
        Height = 58
        Caption = ' Informe o Mês de Referência desejado '
        TabOrder = 1
        object Label1: TLabel
          Left = 12
          Top = 14
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label2: TLabel
          Left = 171
          Top = 14
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object mebMes: TComboBox
          Left = 12
          Top = 31
          Width = 154
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
        object mebAno: TSpinEdit
          Left = 171
          Top = 31
          Width = 98
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object grpPatro: TGroupBox
        Left = 46
        Top = 9
        Width = 323
        Height = 47
        Caption = ' Informe a Patrocinadora desejada '
        TabOrder = 0
        object dblookupPatrocinadora: TCMDBLookupCombo
          Left = 8
          Top = 18
          Width = 286
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object grpGrupo: TGroupBox
        Left = 46
        Top = 117
        Width = 323
        Height = 92
        Caption = ' Informe os Grupos de Dados desejados '
        TabOrder = 2
        object chkDadosCadastrais: TCheckBox
          Left = 15
          Top = 13
          Width = 127
          Height = 17
          Caption = 'Dados Cadastrais'
          TabOrder = 0
        end
        object chkDependentes: TCheckBox
          Left = 15
          Top = 50
          Width = 97
          Height = 17
          Caption = 'Dependentes'
          TabOrder = 2
        end
        object chkEnderecos: TCheckBox
          Left = 15
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Endereços'
          TabOrder = 1
        end
        object chkEvolucaoFuncional: TCheckBox
          Left = 150
          Top = 13
          Width = 166
          Height = 17
          Caption = 'Evolução Funcional'
          TabOrder = 4
        end
        object chkDocumentos: TCheckBox
          Left = 15
          Top = 69
          Width = 97
          Height = 17
          Caption = 'Documentos'
          TabOrder = 3
        end
        object chkEventos: TCheckBox
          Left = 150
          Top = 32
          Width = 166
          Height = 17
          Caption = 'Eventos'
          TabOrder = 5
        end
        object chkLotacoes: TCheckBox
          Left = 150
          Top = 50
          Width = 166
          Height = 17
          Caption = 'Lotações'
          TabOrder = 6
        end
        object chkContatos: TCheckBox
          Left = 150
          Top = 69
          Width = 166
          Height = 17
          Caption = 'Contatos'
          TabOrder = 7
        end
      end
      object GroupBox1: TGroupBox
        Left = 46
        Top = 210
        Width = 323
        Height = 47
        Caption = ' Informe o Tipo de Erro ( opcional )'
        TabOrder = 3
        object dbcmbTipoErro: TwwDBComboBox
          Left = 8
          Top = 16
          Width = 286
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Participante não encontrado '
            'Agência Bancária não encontrada'
            'Banco não encontrado'
            'Nome do Participante alterado'
            'Data de Admissão alterada '
            'Data de Nascimento alterada '
            'CPF alterado '
            'Número de Dependentes para IR alterado '
            'Cargo não encontrado '
            'Cargo alterado '
            'Nivel não encontrado '
            'Nivel alterado '
            'Sexo alterado '
            'Conta Corrente alterada '
            'Erro ao alterar conta corrente '
            'Erro ao alterar nome '
            'Erro ao alterar CPF '
            'Erro ao alterar sexo '
            'Erro ao alterar data de nascimento '
            'Erro ao altarer data de admissão '
            'Erro ao alterar n. dependentes IRRF '
            'Erro ao alterar cargo '
            'Erro ao alterar nivel '
            'Participante Assistido - dados não atualizados  '
            'Participante Mantido - dados não atualizados  '
            'Endereço Inserido '
            'Logradouro alterado '
            'Bairro alterado '
            'CEP alterado '
            'UF do Endereço alterado '
            'Número do Telefone alterado '
            'Cidade do Endereço alterada '
            'Telefone Inserido '
            'Número da Carteira de Identidade alterado '
            'UF da Carteira de Identidade alterada'
            'Data de Expedição da Carteira de Identidade alterada '
            'Nome do Pai alterado '
            'Nome da Mãe alterado '
            'Código do Municipio de Naturalidade alterado '
            'Matrícula do Conjuge alterada  '
            'Tempo de Serviço Total alterado  '
            'Tempo de Serviço Não Creditado  alterado  '
            'Documento de Identidade Inserido '
            'Dependente Inserido (não existia no cadastro) '
            'Estado Civil  alterado  '
            'Indicador para Salário de IR  alterado  '
            'Indicador para Salário Família  alterado  '
            'Indicador de Invalidez  alterado  '
            'Data de Início do Dependente  alterada '
            'Grau de Dependência  alterado  '
            'Indicador de Cargo de Diretor  alterado  '
            'Tempo de Serviço Anterior alterado '
            'Tempo de Serviço Publico Anterior alterado '
            'Tempo de Serviço Privado Anterior alterado '
            'Tempo de Serviço Anterior Real alterado '
            'Filial do Empregado alterada '
            'Filial não encontrada '
            'Situação do Empregado alterada '
            'Vinculação Funcional do Empregado alterada '
            'Função Não Encontrada '
            'Função alterada '
            'Data de Demissão alterada '
            'Data de Readmissão alterada '
            'Data do Falecimento alterada '
            'Participante Cancelado - dados não atualizados  '
            'Cidade do Endereço não encontrada'
            'Agência Bancária em Branco')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object GroupBox2: TGroupBox
        Left = 46
        Top = 258
        Width = 323
        Height = 47
        Caption = 'Categoria da Situação do Particip. na Fundação'
        TabOrder = 4
        object dblkpcmbSitPartInterno: TwwDBLookupCombo
          Left = 9
          Top = 18
          Width = 286
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Categoria de Situação'#9'F')
          LookupTable = qrySitPartInterno
          LookupField = 'FLGINTERNO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object GroupBox3: TGroupBox
        Left = 46
        Top = 314
        Width = 323
        Height = 47
        Caption = 'Situação do Funcionário '
        TabOrder = 5
        object cmbsitfunc: TwwDBLookupCombo
          Left = 9
          Top = 18
          Width = 286
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
          LookupTable = qrysitfunc
          LookupField = 'IDSITFUNC'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 256
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 87
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 301
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'P.IDPESSOA,'
      #9'P.NOME'
      ''
      'FROM'#9'PESSOA P,'
      #9'PATRO PT'
      'WHERE'#9'(PT.IDPESSOA'#9'= P.IDPESSOA)'
      'AND PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER'#9'BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 83
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
      Visible = False
    end
  end
  object qrySitPartInterno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'AT'#39' AS FLGINTERNO, '#39'Ativo'#39'                        AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MA'#39' AS FLGINTERNO, '#39'Mantido'#39'                      AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MP'#39' AS FLGINTERNO, '#39'Mantido Parcial'#39'              AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MS'#39' AS FLGINTERNO, '#39'Manutenção de Saldo de Conta'#39' AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AS'#39' AS FLGINTERNO, '#39'Assistido'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'CA'#39' AS FLGINTERNO, '#39'Cancelado'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AE'#39' AS FLGINTERNO, '#39'Ativo Especial'#39'               AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'PN'#39' AS FLGINTERNO, '#39'Pendente'#39'                     AS DES' +
        'CRICAO FROM DUAL')
    ValidateWithMask = True
    Left = 310
    Top = 146
  end
  object qrysitfunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 286
    Top = 178
  end
end

unit uAtendimento;

interface

Uses SysUtils, uSistema;

type
   TAtendimento = Class;

   {Detalhe da classe TAtendimento.
    Corresponde aos Assuntos do Atendimento (ASSUNTOXATEND)}
   TAssuntos = Class
   private
      fIdAssuntoxAtend :Real;
      {Atributo Identificador do assunto associado ao atendimento. Chave da tabela ASSUNTO}
      fIdAssunto :Real;
      {Atributo Identificador da resposta padrão associada ao assunto selecionada pelo atendente. Chave da tabela ASSUNTOXRESP}
      fIdAssuntoxResposta :Real;
      {Atributo Identificador processo do RAD gerado pelo assunto. Chave da tabela RADINSTPROCESSO}
      fIdProcesso :Real;
      {Atributo Identificador do Atendimento referente ao assunto cadastrado}
      fOwner :TAtendimento;
      FVlrSolicitado: Currency;
      FIDContratoEmptmo: Extended;
      FNumParcelas: Integer;
      procedure SetIDContratoEmptmo(const Value: Extended);
      procedure SetNumParcelas(const Value: Integer);
      procedure SetVlrSolicitado(const Value: Currency);
   public
      {Construtor da classe tendo como Owner o Atendimento a ser referenciado
      pelos Assuntos persistidos pela classe}
      Constructor Create(AOwner:TAtendimento);
      {Insere e valida os assuntos na tabela ASSUNTOXATEND}
      Procedure Insert;
      Property IdAssuntoxAtend :Real read fIdAssuntoxAtend write fIdAssuntoxAtend;
      {Identificador do assunto associado ao atendimento. Chave da tabela ASSUNTO}
      Property IdAssunto :Real  read fIdAssunto write fIdAssunto;
      {Identidicador da Resposta Padrão selecionada para o assunto indicado. Chave da tabela ASSUNTOXRESP}
      Property IdAssuntoxResposta :Real  read fIdAssuntoxResposta write fIdAssuntoxResposta;
      {Número do processo do RAD gerado para o assunto caso este Gere um processo no RAD (definido
       no momento do cadastro do assuunto). Chave da tabela RADINSTPROCESSO}
      Property IdProcesso :Real  read fIdProcesso write fIdProcesso;

      // Marchetti - Pendencia 22042
      property IDContratoEmptmo : Extended read FIDContratoEmptmo write SetIDContratoEmptmo;
      property VlrSolicitado    : Currency read FVlrSolicitado write SetVlrSolicitado;
      property NumParcelas      : Integer read FNumParcelas write SetNumParcelas;
      // Fim Marchetti - Pendencia 22042
   End;

   {Manutenção (inserção e alteração) do Atendimento (Tabela: ATEND)}
   TAtendimento = Class
   private
      {Atributo Identificador dos Assuntos relacionados ao atendimento}
      fAssuntos :TAssuntos;
      {Atributo Identificador da chave da tabela do atendimento (ATEND.IDATEND)}
      fIdAtend :Real;
      {Atributo Identificador do Tipo de Atendimento. Chave da tebela TIPOATEND}
      fIdTipoAtend :Real;
      {Atributo Identificador do Participante como Titular do atendimento}
      fIdTitular :Real;
      {Atributo Identificador Beneficiário }
      fIdbeneficiario :Real;
      {Atributo Identificador da patrocinadora do Titular do anteidmento. Chave da tabela PATRO}
      fIdPessjur :Real;
      {Atributo Identificador do complemento do código do atendimento. Ultilizado como
      referencial sequencial quando o antendimento é encerrado como pendente a continuado por outro atendente}
      fComplCondAtend :Real;
      {Atributo Identificador do computador\local onde o atendimento foi efetuado. Chave da tabela LOCALATENDXCPU}
      fIdLocalAtendXCpu :Real;
      {Atributo Identificador da data/hora de encerramento do atendimento}
      fData :TDateTime;
      {Atributo Identificador da data/hora de início do atendimento}
      fDataInicio :TDateTime;
      {Atributo Identificador do Código do atendimento a ser informado ao Solicitante no momento do atendimento}
      fCodAtend :Real;
      {Atributo Identificador do Usuário responsável pelo atendimento}
      fCodAtendente :String;
      {Atributo Identificador da resposta informada ao solicitande pelo atendente no momento do atendimento. Chave da tabela USUARIOSISTEMA}
      fResposta :String;
      {Atributo Identificador do status do atendimento:
         Cancelado
         Concluído
         Pendente}
      fStatus :String;
      {Atributo Identificador da observação informada pelo atendete}
      fObservacao :String;
      {Atributo Identificador da pergunta feita pelo solicitante caso não seja encontrado no banco de assuntos}
      fPergunta :String;
      {Atributo Identificador do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fNomeSolicitante :String;
      {Atributo Identificador do telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fTelSolicitante :String;
      {Atributo Identificador do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fLogradouro :String;
      {Atributo Identificador do Número do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fNumeroSolic :String;
      {Atributo Identificador do Complemento do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fComplemSolic :String;
      {Atributo Identificador do Bairro do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fBairroSolicitante :String;
      {Atributo Identificador do CEP do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fCepSolicitante :String;
      {Atributo Identificador da Cidade do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fCidadeSolicitante :String;
      {Atributo Identificador da Cidade do Estado do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário. Chave da tabela IDESTADO}
      fIdEstado :LongInt;
      {Atributo Identificador do Estado do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fCodEstadoSolicitante :String;

      {FDIAS - SET/2001 - FCRT}
      {Atributo Identificador do TIPO DE telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fTipoSolic :String;
      {Atributo Identificador do DDI telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fDDISolic :String;
      {Atributo Identificador do DDDtelefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fDDDSolic :String;
      {Atributo Identificador do NUMERO telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      fNumeroTelSolic :String;

      // Daniel - 22898
      // Atributo identificador do NOME do contato do solicitante de atendimento, preenchido automaticamente com os dados do participante/beneficiário...
      fNomeContatoTel  : string;

      fNumdocumentoCPF : string;
      fNumdocumentoRG  : string;
      fEmail           : string;
      // tavares 28/03/2002
      // data e hora de chegada do participante ao posto de atendimento
      fDTHORACHEGADA   : tDateTime;
      // andré tavares - pendência 15048 - 17/09/2003
      fIDUSUARIO : LongInt;

   public
      {Construtor da classe. Inicializa atributos e cria instância da classe TAssuntos dos assuntos do atendimento}
      Constructor Create;
      {Destrutor da classe. Libera atributos e classes instanciadas no Contructor}
      Destructor Destroy; Override;
      {Insere dados do atendimento}
      Procedure Insert;
      {Altera dados do atendimento}
      Procedure Edit;
      {Assuntos relacionados ao atendimento}
      Property Assuntos :TAssuntos read fAssuntos write fAssuntos;

      {Chave da tabela do atendimento (ATEND.IDATEND)}
      Property IdAtend :Real read fIdAtend write fIdAtend;
      {Tipo de Atendimento. Chave da Tabela TIPOATEND. Chave da tebala TIPOATEND}
      Property IdTipoAtend :Real read fIdTipoAtend write fIdTipoAtend;
      {Participante\Beneficiário dito como Titular do atendimento}
      Property IdTitular :Real read fIdTitular write fIdTitular;
      {Patrocinadora do Titular do anteidmento. Chave da tabela PATRO}
       Property Idbeneficiario :Real read fIdbeneficiario write fIdbeneficiario;
      {Patrocinadora do Titular do anteidmento. Chave da tabela PATRO}
      Property IdPessjur :Real read fIdPessjur write fIdPessjur;
      {Complemento do código do atendimento. Ultilizado como
      referencial sequencial quando o antendimento é encerrado como pendente a continuado por outro atendente}
      Property ComplCondAtend :Real read fComplCondAtend write fComplCondAtend;
      {Computador\local onde o atendimento foi efetuado. Chave da tabela LOCALATENDXCPU}
      Property IdLocalAtendXCpu :Real read fIdLocalAtendXCpu write fIdLocalAtendXCpu;
      {Data/hora de encerramento do atendimento}
      Property Data :TDateTime read fData write fData;
      {Data/hora de início do atendimento}
      Property DataInicio :TDateTime read fDataInicio write fDataInicio;
      {Código do atendimento a ser informado ao Solicitante no momento do atendimento}
      Property CodAtend :Real read fCodAtend write fCodAtend;
      {Atributo Identificador do Usuário responsável pelo atendimento. Chave da tabela USUARIOSISTEMA}
      Property CodAtendente :String read fCodAtendente write fCodAtendente;
      {Resposta informada ao solicitande pelo atendente no momento do atendimento}
      Property Resposta :String read fResposta write fResposta;
      {Status do atendimento:
         Cancelado
         Concluído
         Pendente}
      Property Status :String read fStatus write fStatus;
      {Observação informada pelo atendete}
      Property Observacao :String read fObservacao write fObservacao;
      {Pergunta feita pelo solicitante caso não seja encontrado no banco de assuntos}
      Property Pergunta :String read fPergunta write fPergunta;
      {Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property NomeSolicitante :String read fNomeSolicitante write fNomeSolicitante;
      {Telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property TelSolicitante :String read fTelSolicitante write fTelSolicitante;
      {Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property Logradouro :String read fLogradouro write fLogradouro;
      {Número do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property NumeroSolic :String read fNumeroSolic write fNumeroSolic;
      {Complemento do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property ComplemSolic :String read fComplemSolic write fComplemSolic;
      {bairro do Endereço do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property BairroSolicitante :String read fBairroSolicitante write fBairroSolicitante;
      {Cep do Endereço Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property CepSolicitante :String read fCepSolicitante write fCepSolicitante;
      {Cidade do Endereço Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property CidadeSolicitante :String read fCidadeSolicitante write fCidadeSolicitante;
      {Estado do Endereço Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário. Chave da tabela IDESTADO}
      Property IdEstado :LongInt read fIdEstado write fIdEstado;
        {Cidade do Endereço Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property CodEstadoSolicitante :String read fCodEstadoSolicitante write fCodEstadoSolicitante;

      {FDIAS - FCRT - SET/2001}
      {TIPO DE Telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property TipoSolic :String read fTipoSolic write fTipoSolic;
      {DDI DE Telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property DDISolic :String read fDDISolic write fDDISolic;
      {DDD DE Telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property DDDSolic :String read fDDDSolic write fDDDSolic;
      {NUMERO DE Telefone do Solicitante do Atendimento, preenchido automaticamente com os dados do participante/beneficiário}
      Property NumeroTelSolic :String read fNumeroTelSolic write fNumeroTelSolic;

      // Daniel - 22898
      // NOME do contato do solicitante do atendimento, preenchido automaticamente com os dados do participante/beneficiário...
      property NomeContatoTel :string read fNomeContatoTel write fNomeContatoTel;

      Property NumDocumentoCPF : String read  fNumDocumentoCPF write fNumDocumentoCPF;
      Property NumDocumentoRG : String read  fNumDocumentoRG write fNumDocumentoRG;
      Property Email : String read  fEmail write fEmail;
      Property DTHORACHEGADA : TdateTime read  fDTHORACHEGADA write fDTHORACHEGADA;
      // andré tavares - pendência 15048 - 17/09/2003
      Property idUsuario : LongInt read  fIDUSUARIO write fIDUSUARIO;

   End;

Var
   Atendimento : TAtendimento;

implementation

Uses DAtendimento, uDataBase;

{TAtendimento}

constructor TAtendimento.Create;
begin
   inherited

   Create;
   fAssuntos :=  TAssuntos.Create(Self);
end;

destructor TAtendimento.Destroy;
begin
   try
     fAssuntos.Free;
   except end;

   inherited Destroy;
end;

procedure TAtendimento.Insert;
begin
  with DtmAtendimento.QryInsAtend do begin
    fIdAtend                                := LeultRegistro(nil,'ATEND');
    ParamByName('IDATEND').AsFloat          := fIdAtend;
    ParamByName('IDTIPOATEND').AsFloat      := fIdTipoAtend;

    if ( fCodAtend=0 ) then // Novo Atendimento
      ParamByName('CODATEND').AsFloat       := fIdAtend
    else // Sequencia de Atendimento
      ParamByName('CODATEND').AsFloat       := fCodAtend;

    ParamByName('DATA').AsDateTime          := fData;
    ParamByName('CODATENDENTE').AsString    := fCodAtendente;
    ParamByName('RESPOSTA').AsString        := fResposta;
    ParamByName('STATUS').AsString          := fStatus;
    ParamByName('OBSERVACAO').AsString      := fObservacao;
    ParamByName('IDTITULAR').AsFloat        := fIdTitular;
    ParamByName('IDPESSJUR').AsFloat        := fIdPessjur;
    ParamByName('DATAINICIO').AsDateTime    := fDataInicio;
    ParamByName('COMPLCODATEND').AsFloat    := fComplCondAtend;
    ParamByName('IDLOCALATENDXCPU').AsFloat := fIdLocalAtendXCpu;
    ParamByName('PERGUNTA').AsString        := fPergunta;
    ParamByName('NOMESOLICITANTE').AsString := fNomeSolicitante;
    ParamByName('TELSOLICITANTE').AsString  := fTelSolicitante;
    ParamByName('LOGRADOURO').AsString      := fLogradouro;
    ParamByName('NUMEROSOLIC').AsString     := fNumeroSolic;
    ParamByName('COMPLEMSOLIC').AsString    := fComplemSolic;
    ParamByName('BAIRROSOLIC').AsString     := fBairroSolicitante;
    ParamByName('CEPSOLIC').AsString        := fCepSolicitante;
    ParamByName('CIDADESOLIC').AsString     := fCidadeSolicitante;
    ParamByName('IDESTADO').AsFloat         := fIdEstado;
    ParamByName('CODESTADOSOLIC').AsString  := fCODESTADOSOLICITANTE  ;
    ParamByName('TIPOSOLIC').AsString       := fTipoSolic;
    ParamByName('DDISOLIC').AsString        := fDDISolic;
    ParamByName('DDDSOLIC').AsString        := fDDDSolic;
    ParamByName('NUMEROTELSOLIC').AsString  := fNumeroTelSolic;

    // Daniel - 22898
    ParamByName('CONTATOTEL').AsString      := fNomeContatoTel;

    ParamByName('IDBENEFICIARIO').AsFloat   := fIdbeneficiario;
    ParamByName('NUMDOCUMENTOCPF').AsString := fNumdocumentoCPF;
    ParamByName('NUMDOCUMENTORG').AsString  := fNumdocumentoRG;
    ParamByName('EMAIL').AsString           := fEmail;
    ParamByName('DTHORACHEGADA').asDateTime := fDTHORACHEGADA;
    // andré tavares - pendência 15048 - 17/09/2003
    ParamByName('IDUSUARIO').asFloat        := sistema.IdUsuario;

    ExecSql
  end;
end;

procedure TAtendimento.Edit;
begin
  with DtmAtendimento.QryUpdAtend do begin
    ParamByName('IDATEND').AsFloat          := fIdAtend;
    ParamByName('IDTIPOATEND').AsFloat      := fIdTipoAtend;
    ParamByName('IDTITULAR').AsFloat        := fIdTitular;
    ParamByName('IDPESSJUR').AsFloat        := fIdPessjur;
    ParamByName('COMPLCODATEND').AsFloat    := fComplCondAtend;
    ParamByName('IDLOCALATENDXCPU').AsFloat := fIdLocalAtendXCpu;
    ParamByName('DATA').AsDateTime          := fData;
    ParamByName('DATAINICIO').AsDateTime    := fDataInicio;
    ParamByName('CODATEND').AsFloat         := fCodAtend;
    ParamByName('CODATENDENTE').AsString    := fCodAtendente;
    ParamByName('RESPOSTA').AsString        := fResposta;
    ParamByName('STATUS').AsString          := fStatus;
    ParamByName('OBSERVACAO').AsString      := fObservacao;
    ParamByName('PERGUNTA').AsString        := fPergunta;
    ParamByName('NOMESOLICITANTE').AsString := fNomeSolicitante;
    ParamByName('TELSOLICITANTE').AsString  := fTelSolicitante;
    ParamByName('LOGRADOURO').AsString      := fLogradouro;
    ParamByName('NUMEROSOLIC').AsString     := fNumeroSolic;
    ParamByName('COMPLEMSOLIC').AsString    := fComplemSolic;
    ParamByName('BAIRROSOLIC').AsString     := fBairroSolicitante;
    ParamByName('CEPSOLIC').AsString        := fCepSolicitante;
    ParamByName('CIDADESOLIC').AsString     := fCidadeSolicitante;
    ParamByName('IDESTADO').AsFloat         := fIdEstado;
    ParamByName('CODESTADOSOLIC').AsString  := fCODESTADOSOLICITANTE;
    ParamByName('TIPOSOLIC').AsString       := fTipoSolic;
    ParamByName('DDISOLIC').AsString        := fDDISolic;
    ParamByName('DDDSOLIC').AsString        := fDDDSolic;
    ParamByName('NUMEROTELSOLIC').AsString  := fNumeroTelSolic;

    // Daniel - 22898
    ParamByName('CONTATOTEL').AsString      := fNomeContatoTel;

    ParamByName('IDBENEFICIARIO').Asfloat   := fidbeneficiario;
    ParamByName('NUMDOCUMENTOCPF').AsString := fNumdocumentoCPF;
    ParamByName('NUMDOCUMENTORG').AsString  := fNumdocumentoRG;
    ParamByName('EMAIL').AsString           := fEmail;
    ParamByName('DTHORACHEGADA').asDateTime := fDTHORACHEGADA;
    // andré tavares - pendência 15048 - 17/09/2003
    ParamByName('IDUSUARIO').asFloat        := sistema.IdUsuario;

    ExecSql
  end;
end;

{TAssuntos}

Constructor TAssuntos.Create(AOwner:TAtendimento);
Begin
  Inherited Create;
  fOwner := AOwner;
End;

procedure TAssuntos.Insert;
begin
  with DtmAtendimento.QryinsAssunto do begin
    fIdAssuntoxAtend                         := LeultRegistro(nil,'ASSUNTOXATEND');
    ParamByName('IDASSUNTOXATEND').AsFloat   := fIdAssuntoxAtend;
    ParamByName('IDASSUNTO').AsFloat         := fIdAssunto;
    ParamByName('IDATEND').AsFloat           := fOwner.IdAtend;

    if (fIdAssuntoxResposta>0) then
       ParamByName('IDASSUNTOXRESP').AsFloat := fIdAssuntoxResposta
    else
       ParamByName('IDASSUNTOXRESP').Clear;

    if (fIdProcesso>0) then
       ParamByName('IDPROCESSO').AsFloat     := fIdProcesso
    else
       ParamByName('IDPROCESSO').Clear;


    if FIDContratoEmptmo > 0 then
       ParamByName('IDCONTRATOEMPTMO').AsFloat := FIDContratoEmptmo
    else
       ParamByName('IDCONTRATOEMPTMO').Clear;

    if FVlrSolicitado > 0 then
       ParamByName('VLRSOLICITADO').AsFloat := FVlrSolicitado
    else
       ParamByName('VLRSOLICITADO').Clear;

    if FNumParcelas > 0 then
       ParamByName('NUMPARCELAS').AsFloat := FNumParcelas
    else
       ParamByName('NUMPARCELAS').Clear;

    ExecSql;
  end;
end;

procedure TAssuntos.SetIDContratoEmptmo(const Value: Extended);
begin
   FIDContratoEmptmo := Value;
end;



procedure TAssuntos.SetNumParcelas(const Value: Integer);
begin
   FNumParcelas := Value;
end;



procedure TAssuntos.SetVlrSolicitado(const Value: Currency);
begin
   FVlrSolicitado := Value;
end;



end.

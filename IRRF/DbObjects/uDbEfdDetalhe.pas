unit uDbEfdDetalhe;

{*******************************************************************************
Analista.: William Santana
Data.....: 17/02/2014
Kintana..: 2051763
Sol......: 155850-15363
Descrição: Alteração da Funcionalidade SPED
*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 1235889
Sol......: 155850
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}


interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbEFDDetalhe = class(TCmDbObject)

  private
    FSecaoJud: TCmDbField;
    FCNPJPesJur: TCmDbField;
    FIdContador: TCmDbField;
    FNaturezaAcao: TCmDbField;
    FNumProcJud: TCmDbField;
    FNumProcesso: TCmDbField;
    FCodContribApur: TCmDbField;
    FCodCritEscrit: TCmDbField;
    FNomeinforme: TCmDbField;
    FVara: TCmDbField;
    FCodQualiPesJur: TCmDbField;
    FCodApropCred: TCmDbField;
    FCodSitTrib: TCmDbField;
    FCodAtividade: TCmDbField;
    FIdinforme: TCmDbField;
    FIdFundacao: TCmDbField;
    FDescricaoJud: TCmDbField;
    FCodOrigemProcesso: TCmDbField;
    FDataSentenca: TCmDbField;
    FCRC: TCmDbField;
    FCodIncidTrib: TCmDbField;
    FTelefone: TCmDbField;
    FCPF_Contador: TCmDbField;
    FIdEndPess: TCmDbField;
    FEmail: TCmDbField;
    FIdRelatorioDados: TCmDbField;
    FIdCodDetalhe: TCmDbField;

    //Início - William Santana SOL 155850-15363 KIN 2051763
    FTipocontribpisconfins: TCmDbField;
    FCodcontribapurada    : TCmDbField;
    FCodrfbpis            : TCmDbField;
    FCodrfbconfins        : TCmDbField;
    //Término - William Santana SOL 155850-15363 KIN 2051763

    procedure SetCNPJPesJur(const Value: TCmDbField);
    procedure SetCodApropCred(const Value: TCmDbField);
    procedure SetCodAtividade(const Value: TCmDbField);
    procedure SetCodContribApur(const Value: TCmDbField);
    procedure SetCodCritEscrit(const Value: TCmDbField);
    procedure SetCodIncidTrib(const Value: TCmDbField);
    procedure SetCodOrigemProcesso(const Value: TCmDbField);
    procedure SetCodQualiPesJur(const Value: TCmDbField);
    procedure SetCodSitTrib(const Value: TCmDbField);
    procedure SetCPF_Contador(const Value: TCmDbField);
    procedure SetCRC(const Value: TCmDbField);
    procedure SetDataSentenca(const Value: TCmDbField);
    procedure SetDescricaoJud(const Value: TCmDbField);
    procedure SetEmail(const Value: TCmDbField);
    procedure SetIdCodDetalhe(const Value: TCmDbField);
    procedure SetIdContador(const Value: TCmDbField);
    procedure SetIdEndPess(const Value: TCmDbField);
    procedure SetIdFundacao(const Value: TCmDbField);
    procedure SetIdinforme(const Value: TCmDbField);
    procedure SetIdRelatorioDados(const Value: TCmDbField);
    procedure SetNaturezaAcao(const Value: TCmDbField);
    procedure SetNomeinforme(const Value: TCmDbField);
    procedure SetNumProcesso(const Value: TCmDbField);
    procedure SetNumProcJud(const Value: TCmDbField);
    procedure SetSecaoJud(const Value: TCmDbField);
    procedure SetTelefone(const Value: TCmDbField);
    procedure SetVara(const Value: TCmDbField);

    //Início - William Santana SOL 155850-15363 KIN 2051763
    procedure SetTipocontribpisconfins(const Value: TCmDbField);
    procedure SetCodcontribapurada(const Value: TCmDbField);
    procedure SetCodrfbpis(const Value: TCmDbField);
    procedure SetCodrfbconfins(const Value: TCmDbField);
    //Término - William Santana SOL 155850-15363 KIN 2051763
  protected

  public
     Property Nomeinforme: TCmDbField read FNomeinforme write SetNomeinforme;
     Property Idinforme: TCmDbField read FIdinforme write SetIdinforme;

     Property IdCodDetalhe       : TCmDbField read FIdCodDetalhe      write SetIdCodDetalhe;
     Property IdRelatorioDados   : TCmDbField read FIdRelatorioDados  write SetIdRelatorioDados;
     Property CodQualiPesJur     : TCmDbField read FCodQualiPesJur    write SetCodQualiPesJur;
     Property CodAtividade       : TCmDbField read FCodAtividade      write SetCodAtividade;
     Property CodSitTrib         : TCmDbField read FCodSitTrib        write SetCodSitTrib;
     Property NumProcesso        : TCmDbField read FNumProcesso       write SetNumProcesso;
     Property CodOrigemProcesso  : TCmDbField read FCodOrigemProcesso write SetCodOrigemProcesso;
     Property CodIncidTrib       : TCmDbField read FCodIncidTrib      write SetCodIncidTrib;
     Property CodApropCred       : TCmDbField read FCodApropCred      write SetCodApropCred;
     Property CodCritEscrit      : TCmDbField read FCodCritEscrit     write SetCodCritEscrit;
     Property CodContribApur     : TCmDbField read FCodContribApur    write SetCodContribApur;
     Property IdFundacao         : TCmDbField read FIdFundacao        write SetIdFundacao;
     Property CNPJPesJur         : TCmDbField read FCNPJPesJur        write SetCNPJPesJur;
     Property IdContador         : TCmDbField read FIdContador        write SetIdContador;
     Property CPF_Contador       : TCmDbField read FCPF_Contador      write SetCPF_Contador;
     Property CRC                : TCmDbField read FCRC               write SetCRC;
     Property Telefone           : TCmDbField read FTelefone          write SetTelefone;
     Property Email              : TCmDbField read FEmail             write SetEmail;
     Property IdEndPess          : TCmDbField read FIdEndPess         write SetIdEndPess;
     Property NumProcJud         : TCmDbField read FNumProcJud        write SetNumProcJud;
     Property NaturezaAcao       : TCmDbField read FNaturezaAcao      write SetNaturezaAcao;
     Property SecaoJud           : TCmDbField read FSecaoJud          write SetSecaoJud;
     Property Vara               : TCmDbField read FVara              write SetVara;
     Property DataSentenca       : TCmDbField read FDataSentenca      write SetDataSentenca;
     Property DescricaoJud       : TCmDbField read FDescricaoJud      write SetDescricaoJud;

     //Início - William Santana SOL 155850-15363 KIN 2051763
     Property Tipocontribpisconfins : TCmDbField read FTipocontribpisconfins     write SetTipocontribpisconfins;
     Property Codcontribapurada     : TCmDbField read FCodcontribapurada         write SetCodcontribapurada    ;
     Property Codrfbpis             : TCmDbField read FCodrfbpis                 write SetCodrfbpis            ;
     Property Codrfbconfins         : TCmDbField read FCodrfbconfins             write SetCodrfbconfins        ;
     //Término - William Santana SOL 155850-15363 KIN 2051763

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Function    Insert  : boolean; override;
     Function LoadFromDb : Boolean; Override;

  end;

implementation

{ TDbEFDDetalhe }

constructor TDbEFDDetalhe.Create(Aowner: TCmCustomCdbObject);


begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'DADOS_EFD_CONTRIB_DETALHE';

  FIdCodDetalhe := CreateCmDbField('IDCODDETALHE', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      true, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name

  FIdRelatorioDados  := CreateCmDbField('IDRELATORIODADOS',ftfloat,True,True,False,True,'');
  FCodQualiPesJur    := CreateCmDbField('CODQUALIPESJUR',ftString,False,False,False,True,'');
  FCodAtividade      := CreateCmDbField('CODATIVIDADE',ftString,False,False,False,True,'');
  FCodSitTrib        := CreateCmDbField('CODSITTRIB',ftString,False,False,False,True,'');
  FNumProcesso       := CreateCmDbField('NUMPROCESSO',ftString,False,False,False,True,'');
  FCodOrigemProcesso := CreateCmDbField('CODORIGEMPROCESSO',ftString,False,False,False,True,'');
  FCodIncidTrib      := CreateCmDbField('CODINCIDTRIB',ftString,False,False,False,True,'');
  FCodApropCred      := CreateCmDbField('CODAPROPCRED',ftString,False,False,False,True,'');
  FCodCritEscrit     := CreateCmDbField('CODCRITESCRIT',ftString,False,False,False,True,'');
  FCodContribApur    := CreateCmDbField('CODCONTRIBAPUR',ftString,False,False,False,True,'');
  FIdFundacao        := CreateCmDbField('IDFUNDACAO',ftfloat,False,False,False,True,'');
  FCNPJPesJur        := CreateCmDbField('CNPJPESJUR',ftString,False,False,False,True,'');
  FIdContador        := CreateCmDbField('IDCONTADOR',ftfloat,False,False,False,True,'');
  FCPF_Contador      := CreateCmDbField('CPF_CONTADOR',ftString,False,False,False,True,'');
  FCRC               := CreateCmDbField('CRC',ftString,False,False,False,True,'');
  FTelefone          := CreateCmDbField('TELEFONE',ftString,False,False,False,True,'');
  FEmail             := CreateCmDbField('EMAIL',ftString,False,False,False,True,'');
  FIdEndPess         := CreateCmDbField('IDENDPESS',ftfloat,False,False,False,True,'');
  FNumProcJud        := CreateCmDbField('NUMPROCJUD',ftString,False,False,False,True,'');
  FNaturezaAcao      := CreateCmDbField('NATUREZAACAO',ftString,False,False,False,True,'');
  FSecaoJud          := CreateCmDbField('SECAOJUD',ftString,False,False,False,True,'');
  FVara              := CreateCmDbField('VARA',ftString,False,False,False,True,'');
  FDataSentenca      := CreateCmDbField('DATASENTENCA',ftdateTime,False,False,False,False,'');
  FDescricaoJud      := CreateCmDbField('DESCRICAOJUD',ftString,False,False,False,True,'');

  //Início - William Santana SOL 155850-15363 KIN 2051763
  FTipocontribpisconfins := CreateCmDbField('TIPOCONTRIBPISCONFINS',ftString,False,False,False,True,'');
  FCodcontribapurada     := CreateCmDbField('CODCONTRIBAPURADA',ftString,False,False,False,True,'');
  FCodrfbpis             := CreateCmDbField('CODRFBPIS',ftString,False,False,False,True,'');
  FCodrfbconfins         := CreateCmDbField('CODRFBCONFINS',ftString,False,False,False,True,'');
  //Término - William Santana SOL 155850-15363 KIN 2051763
end;

function TDbEFDDetalhe.Insert: boolean;
begin
   FIdCodDetalhe.AsFloat := LeUltRegistro(Nil, 'DADOS_EFD_CONTRIB_DETALHE');  //GetSequence('DADOS_EFD_CONTRIB_DETALHE');
   Result := Inherited Insert;

end;

function TDbEFDDetalhe.LoadFromDb: Boolean;
begin
  Result := inherited LoadFromDB;
end;

procedure TDbEFDDetalhe.SetCNPJPesJur(const Value: TCmDbField);
begin
  FCNPJPesJur := Value;
end;

procedure TDbEFDDetalhe.SetCodApropCred(const Value: TCmDbField);
begin
  FCodApropCred := Value;
end;

procedure TDbEFDDetalhe.SetCodAtividade(const Value: TCmDbField);
begin
  FCodAtividade := Value;
end;

procedure TDbEFDDetalhe.SetCodContribApur(const Value: TCmDbField);
begin
  FCodContribApur := Value;
end;

procedure TDbEFDDetalhe.SetCodCritEscrit(const Value: TCmDbField);
begin
  FCodCritEscrit := Value;
end;

procedure TDbEFDDetalhe.SetCodIncidTrib(const Value: TCmDbField);
begin
  FCodIncidTrib := Value;
end;

procedure TDbEFDDetalhe.SetCodOrigemProcesso(const Value: TCmDbField);
begin
  FCodOrigemProcesso := Value;
end;

procedure TDbEFDDetalhe.SetCodQualiPesJur(const Value: TCmDbField);
begin
  FCodQualiPesJur := Value;
end;

procedure TDbEFDDetalhe.SetCodSitTrib(const Value: TCmDbField);
begin
  FCodSitTrib := Value;
end;

procedure TDbEFDDetalhe.SetCPF_Contador(const Value: TCmDbField);
begin
  FCPF_Contador := Value;
end;

procedure TDbEFDDetalhe.SetCRC(const Value: TCmDbField);
begin
  FCRC := Value;
end;

procedure TDbEFDDetalhe.SetDataSentenca(const Value: TCmDbField);
begin
  FDataSentenca := Value;
end;

procedure TDbEFDDetalhe.SetDescricaoJud(const Value: TCmDbField);
begin
  FDescricaoJud := Value;
end;

procedure TDbEFDDetalhe.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDbEFDDetalhe.SetIdCodDetalhe(const Value: TCmDbField);
begin
  FIdCodDetalhe := Value;
end;

procedure TDbEFDDetalhe.SetIdContador(const Value: TCmDbField);
begin
  FIdContador := Value;
end;

procedure TDbEFDDetalhe.SetIdEndPess(const Value: TCmDbField);
begin
  FIdEndPess := Value;
end;

procedure TDbEFDDetalhe.SetIdFundacao(const Value: TCmDbField);
begin
  FIdFundacao := Value;
end;

procedure TDbEFDDetalhe.SetIdinforme(const Value: TCmDbField);
begin
  FIdinforme := Value;
end;

procedure TDbEFDDetalhe.SetIdRelatorioDados(const Value: TCmDbField);
begin
  FIdRelatorioDados := Value;
end;

procedure TDbEFDDetalhe.SetNaturezaAcao(const Value: TCmDbField);
begin
  FNaturezaAcao := Value;
end;

procedure TDbEFDDetalhe.SetNomeinforme(const Value: TCmDbField);
begin
  FNomeinforme := Value;
end;

procedure TDbEFDDetalhe.SetNumProcesso(const Value: TCmDbField);
begin
  FNumProcesso := Value;
end;

procedure TDbEFDDetalhe.SetNumProcJud(const Value: TCmDbField);
begin
  FNumProcJud := Value;
end;

procedure TDbEFDDetalhe.SetSecaoJud(const Value: TCmDbField);
begin
  FSecaoJud := Value;
end;

procedure TDbEFDDetalhe.SetTelefone(const Value: TCmDbField);
begin
  FTelefone := Value;
end;

procedure TDbEFDDetalhe.SetVara(const Value: TCmDbField);
begin
  FVara := Value;
end;

//Início - William Santana SOL 155850-15363 KIN 2051763
procedure TDbEFDDetalhe.SetTipocontribpisconfins(const Value: TCmDbField);
begin
  FTipocontribpisconfins := Value;
end;
procedure TDbEFDDetalhe.SetCodcontribapurada(const Value: TCmDbField);
begin
  FCodcontribapurada := Value;
end;
procedure TDbEFDDetalhe.SetCodrfbpis(const Value: TCmDbField);
begin
  FCodrfbpis := Value;
end;
procedure TDbEFDDetalhe.SetCodrfbconfins(const Value: TCmDbField);
begin
  FCodrfbconfins := Value;
end;
//Término - William Santana SOL 155850-15363 KIN 2051763


end.

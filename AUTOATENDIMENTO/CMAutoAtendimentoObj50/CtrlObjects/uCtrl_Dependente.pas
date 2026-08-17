{
--------------------------------------------------------------------------------
Pendência   : SOL 164224 Kintana 1419154
Responsável : Fanuel Junior
Data        : 10/10/2011
Descrição   : Quando o participante cancelar um dependente que possui marcação
              de imposto de renda - flgdepir = 1 e inicioimpostor is not null
              a data fim do imposto de renda - fimimpostor também deve ser
              preenchidas como a datacancela
--------------------------------------------------------------------------------
Pendência   : SOL 164302 Kintana 1419174
Responsável : Fanuel Junior
Data        : 22/09/2011
Descrição   : Marcar na tabela LOGALTDEPENDENTES o campo DATACANCELA quando é
              excluido um dependente.
--------------------------------------------------------------------------------
Pendência   : SOL 144873 KINTANA 961354
Responsável : BRUNO AZEVEDO
Data        : 08/12/2010
Descrição   : Ajustes para atender as necessidades do cliente.
--------------------------------------------------------------------------------
Pendência   : SOL 143967 KINTANA 942327
Responsável : BRUNO AZEVEDO
Data        : 09/12/2010
Descrição   : Criação do LOG de manutenção dos dependentes.
--------------------------------------------------------------------------------
Pendência   : SOL 141367 KINTANA 894033
Responsável : BRUNO AZEVEDO
Data        : 31/08/2010
Descrição   : Implementação da verificação de dependentes válidos.
--------------------------------------------------------------------------------
}
unit uCtrl_Dependente;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, dbclient, db,
     uCmTypes, uDb_Dependente, uCtrl_Pessoa, uCtrl_PessoaFisica, uCtrl_Depentit,
     uMidasUtil,
     // Pendência 23274 - 28/12/2007
     uSistema, uCmFileUtils, uCtrl_DocPessoa, uCtrlParamGlobal, uCtrlWebEmpresaProp,
     uDbParamGlobal, uCtrlTipoDocPessoa, uDbTipoDocPessoa, uValidaDoc;

type
  TOperacao = (opInserir, opAlterar, opExcluir);

Type
  TCtrl_Dependente = class(TCmControlObject)
  private

    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    FCdsCancelados: TCMClientDataSet;
    FCdsAux: TCMClientDataSet;
    FCdsDependente: TCMClientDataSet;
    FCdsDepentit: TCMClientDataSet;
    FCdsPessoa: TCMClientDataSet;
    FDb_Dependente: TDb_Dependente;
    FCdsPessoaFisica: TCMClientDataSet;
    // Pendência 23274 - 28/12/2007
    FCdsParamGlobal: TCMClientDataSet;
    FDbParamGlobal: TDbParamGlobal;
    FCdsDocPessoa: TCMClientDataSet;
    FCdsTipoDocPessoa: TCMClientDataSet;
    FDbTipoDocPessoa: TDbTipoDocPessoa;
    procedure SetDbParamGlobal(const Value: TDbParamGlobal);
    procedure SetCdsParamGlobal(const Value: TCMClientDataSet);
    procedure SetCdsDocPessoa(const Value: TCMClientDataSet);
    procedure SetDbTipoDocPessoa(const Value: TDbTipoDocPessoa);
    procedure SetCdsTipoDocPessoa(const Value: TCMClientDataSet);
    // Fim Pendência 23274
    procedure SetCdsDependente(const Value: TCMClientDataSet);
    procedure SetDb_Dependente(const Value: TDb_Dependente);
    procedure SetCdsDepentit(const Value: TCMClientDataSet);
    procedure SetCdsPessoa(const Value: TCMClientDataSet);
    procedure SetCdsPessoaFisica(const Value: TCMClientDataSet);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    Pessoa       : TCtrl_Pessoa;
    PessoaFisica : TCtrl_PessoaFisica;
    Depentit     : TCtrl_Depentit;
    // Pendência 23274 - 28/12/2007
    DocPessoa    : TCtrl_DocPessoa;
    ParamGlobal  : TCtrlParamGlobal;
    TipoDocPessoa: TCtrlTipoDocPessoa;
    // Fim Pendência 23274

    constructor Create; override;
    destructor Destroy; override;

    property Db_Dependente : TDb_Dependente read FDb_Dependente write SetDb_Dependente;
    property CdsDependente : TCMClientDataSet read FCdsDependente write SetCdsDependente;

    //ClientDataSets para atualizar DbObjects externos
    property CdsPessoa : TCMClientDataSet read FCdsPessoa write SetCdsPessoa;
    property CdsDepentit : TCMClientDataSet read FCdsDepentit write SetCdsDepentit;
    property CdsPessoaFisica : TCMClientDataSet read FCdsPessoaFisica write SetCdsPessoaFisica;
    // Pendência 23274 - 28/12/2007
    property CdsDocPessoa   : TCMClientDataSet read FCdsDocPessoa write SetCdsDocPessoa;
    property CdsParamGlobal : TCMClientDataSet read FCdsParamGlobal write SetCdsParamGlobal;
    property DbParamGlobal  : TDbParamGlobal   read FDbParamGlobal write SetDbParamGlobal;
    property CdsTipoDocPessoa: TCMClientDataSet read FCdsTipoDocPessoa write SetCdsTipoDocPessoa;
    property DbTipoDocPessoa : TDbTipoDocPessoa read FDbTipoDocPessoa write SetDbTipoDocPessoa;
    // Fim Pendência 23274

    function SelecionaDependentes( iIdPessoa : integer ) : OleVariant;

    function SelecionaDependente( iIdPessoa, iIdDependente : integer ) : OleVariant;
    function DependentesCancelados( iIdTitular : integer ) : OleVariant;
    function ListaDepen : OleVariant;
    function ListaGrInstr : OleVariant;
    function GravaDependente : integer;
    function ExcluiDependente : Boolean;

    function CancelaDependente( iIdTitular, iIdDependente : integer ) : boolean;
    function RestauraDependente( iIdTitular, iIdDependente : integer ) : boolean;

    function QtdeTotal( iIdTitular : integer ) : integer;
    function QtdeIRRF( iIdTitular : integer ) : integer;
    function QtdeSalFamilia( iIdTitular : integer ) : integer;
    function ProximoSeq( iIdTitular : integer ) : integer;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    function IncluirDependente( bEmTransacao : boolean = False; iIdSitDependente : integer = 0) : Boolean;
    function AlterarDependente( bEmTransacao : boolean = False; iIdSitDependente : integer = 0) : boolean;
    function ExcluirDependente( iIdPessoa : integer; bEmTransacao : boolean = False ) : Boolean;
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    function CancelarDependente(): Boolean;
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468

    //BRUNO AZEVEDO SOL 143967 KINTANA 942327
    procedure GravaLogDependente(pIdPessoa, pIdTitular: Integer; xDataSet, xDataSetAnt: TCMClientDataSet; pTipo: TOperacao);
    //BRUNO AZEVEDO SOL 143967 KINTANA 942327

  published

end;

var
  // Pendência 23274 - 28/12/2007
  WebEmpresaProp : TCtrlWebEmpresaProp;
  iIdEmpresaProp : integer;

implementation

{ TCtrl_Dependente }

constructor TCtrl_Dependente.Create;
begin
  inherited;

  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  FCdsCancelados    := TCMClientDataSet.Create( nil );
  FCdsAux           := TCMClientDataSet.Create( nil );
  FCdsPessoa        := TCMClientDataSet.Create( nil );
  FCdsDepentit      := TCMClientDataSet.Create( nil );
  FCdsPessoaFisica  := TCMClientDataSet.Create( nil );
  // Pendência 23274 - 28/12/2007
  FCdsDocPessoa     := TCMClientDataSet.Create( nil );
  FCdsParamGlobal   := TCMClientDataSet.Create( nil );
  FDbParamGlobal    := TDbParamGlobal.Create( Self );
  FCdsTipoDocPessoa := TCMClientDataSet.Create( nil );
  FDbTipoDocPessoa  := TDbTipoDocPessoa.Create( Self );
  // Fim Pendência 23274
  FDb_Dependente    := TDb_Dependente.Create( Self );
                                                           
end;

destructor TCtrl_Dependente.Destroy;
begin
  FDb_Dependente.Free;

  FCdsPessoa.Free;
  FCdsDepentit.Free;
  FCdsPessoaFisica.Free;
  // Pendência 23274 - 28/12/2007
  FCdsDocPessoa.Free;
  FDbParamGlobal.Free;
  FCdsParamGlobal.Free;
  FDbTipoDocPessoa.Free;
  FCdsTipoDocPessoa.Free;
  // Fim Pendência 23274

  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  FCdsCancelados.Free;
  FCdsAux.Free;

  Pessoa.Free;
  PessoaFisica.Free;
  Depentit.Free;
  // Pendência 23274 - 28/12/2007
  DocPessoa.Free;
  ParamGlobal.Free;
  TipoDocPessoa.Free;
  // Fim Pendência 23274

  if IsAppServer then FCdsDependente.Free;

  inherited;
end;

procedure TCtrl_Dependente.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_Dependente.DataBaseName   := DataBaseName
  else
    FDb_Dependente.dbADOConnection   := dbADOConnection;

  if DbConnectionType = cntBDE then
    FDbParamGlobal.DataBaseName    := DataBaseName
  else
    FDbParamGlobal.dbADOConnection := dbADOConnection;

  Pessoa := TCtrl_Pessoa.Create;
  Pessoa.InitializeAs( Self );

  PessoaFisica := TCtrl_PessoaFisica.Create;
  PessoaFisica.InitializeAs( Self );

  Depentit := TCtrl_Depentit.Create;
  Depentit.InitializeAs( Self );

  // Pendência 23274 - 28/12/2007
  DocPessoa := TCtrl_DocPessoa.Create;
  DocPessoa.InitializeAs( Self );

  WebEmpresaProp  := TCtrlWebEmpresaProp.Create;
  WebEmpresaProp.InitializeAs( Self );

  with TCMClientDataSet.Create(nil) do
  begin
     //Carrega os dados da empresa proprietária
     Data := WebEmpresaProp.EmpresaProp;
     iIdEmpresaProp := FieldByName('IDPESSOA').AsInteger;
     Close;
     Free;
  end;

  ParamGlobal := TCtrlParamGlobal.Create;
  ParamGlobal.InitializeAs( Self );
  TipoDocPessoa := TCtrlTipoDocPessoa.Create;
  TipoDocPessoa.InitializeAs( Self );
  // Fim Pendência 23274

end;

function TCtrl_Dependente.GravaDependente: integer;
var
  Msg : String;
  bNovo, bRestauraDep : boolean;
  bNovoDoc : boolean; // Pendência 23274 - 28/12/2007
  iIdPessoa : integer;
  iIdSitDependente : integer; //BRUNO AZEVEDO SOL 144873 KINTANA 961354
  bOk, bTinhaImposto : boolean;
  ValidaDoc :TCMValidaDoc; // Pendência 23274 - 14/01/2008
  varFields : variant;
begin
  Result := 0;
  iIdPessoa := 0;
  bOk := False;
  bNovo := false;

  if ConnectionSide = cnsClient then
  begin
    bOk := ( Connection.AppServer.GravarDependente( CdsDependente.Data ) > 0 );
    if not bOk then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsPessoa.Close;
      FCdsPessoaFisica.Close;
      FCdsDepentit.Close;
      // Pendência 23274 - 14/01/2008
      FCdsDocPessoa.Close;
      FCdsCancelados.Close;
      bRestauraDep := False;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      FCdsCancelados.Data := DependentesCancelados( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      if not FCdsCancelados.IsEmpty then
      begin
        if (FCdsDependente.FieldByName('NOME').AsString <> '') then begin
          //if (FCdsCancelados.Locate('NOME',FCdsDependente.FieldByName('NOME').AsString,[])) then begin
           varfields := VarArrayCreate([0,1],varVariant);
           varFields[0] := FCdsDependente.FieldByName('NOME').AsString;
           varFields[1] := FCdsDependente.FieldByName('DATANASC').AsString;
           if (FCdsCancelados.Locate('NOME;DATANASC',varFields,[loCaseInsensitive])) then begin
              bNovo := False;
              FCdsDependente.Edit;
              FCdsDependente.FieldByName('IDPESSOA').AsInteger := FCdsCancelados.FieldByName('IDPESSOA').AsInteger;
              FCdsDependente.Post;
              bRestauraDep := True;
           end
           else
              begin
                 bNovo := ( cdsDependente.FieldByName('IDPESSOA').AsInteger <= 0 );
              end;


      {  end else begin
          if (FCdsCancelados.Locate('DATANASC',FCdsDependente.FieldByName('DATANASC').AsString,[])) then begin
            bNovo := False;
            FCdsDependente.Edit;
            FCdsDependente.FieldByName('IDPESSOA').AsInteger := FCdsCancelados.FieldByName('IDPESSOA').AsInteger;
            FCdsDependente.Post;
            bRestauraDep := True;
          end else begin
            bNovo := ( cdsDependente.FieldByName('IDPESSOA').AsInteger <= 0 );
          end;
        end;  }
        end;
       end
       else begin
        //BRUNO AZEVEDO SOL 144873 KINTANA 961354
        bNovo := ( cdsDependente.FieldByName('IDPESSOA').AsInteger <= 0 );
        CmDebugToFile('Here','C:\AAErro.txt');
      end;

      if bNovo then
         CmDebugToFile('Eh novo','C:\AAErro.txt');

      FCdsAux.Close;
      FCdsAux.Data := SelecionaDependente( FCdsDependente.FieldByName('IDTITULAR').AsInteger, FCdsDependente.FieldByName('IDPESSOA').AsInteger );

      //BRUNO AZEVEDO SOL 143967 KINTANA 942327
      if (bNovo) then begin
        GravaLogDependente(FCdsDependente.FieldByName('IDPESSOA').AsInteger, FCdsDependente.FieldByName('IDTITULAR').AsInteger, FCdsDependente, FCdsAux, opInserir);
      end else begin
        GravaLogDependente(FCdsDependente.FieldByName('IDPESSOA').AsInteger, FCdsDependente.FieldByName('IDTITULAR').AsInteger, FCdsDependente, FCdsAux, opAlterar);
      end;
      //BRUNO AZEVEDO SOL 143967 KINTANA 942327

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      //Se é inclusão...
      if bNovo then
      begin
        //Inclui PESSOA
        FCdsPessoa.Data := Pessoa.SelecionaPessoa( -1 );
        FCdsPessoa.Data := CopyClientDataSet( FCdsPessoa );
        FCdsPessoa.Insert;

        //Inclui PESSOAFISICA
        FCdsPessoaFisica.Data := PessoaFisica.SelecionaPessoaFisica( -1 );
        FCdsPessoaFisica.Data := CopyClientDataSet( FCdsPessoaFisica );
        FCdsPessoaFisica.Insert;
      end
      else
      begin
        //Altera PESSOA
        FCdsPessoa.Data := Pessoa.SelecionaPessoa( FCdsDependente.FieldByName('IDPESSOA').AsInteger );
        FCdsPessoa.Data := CopyClientDataSet( FCdsPessoa );
        FCdsPessoa.Edit;

        //Atualiza PESSOAFISICA
        FCdsPessoaFisica.Data := PessoaFisica.SelecionaPessoaFisica( FCdsDependente.FieldByName('IDPESSOA').AsInteger );
        FCdsPessoaFisica.Data := CopyClientDataSet( FCdsPessoaFisica );
        FCdsPessoaFisica.Edit;
      end;

      //Grava PESSOA
      FCdsPessoa.FieldByName('NOME').AsString := FCdsDependente.FieldByName('NOME').AsString;
      //Pendência 23274 - 28/12/2007
      FCdsPessoa.FieldByName('NUMDOCUMENTO').AsString := FCdsDependente.FieldByName('NUMDOCUMENTO').AsString;
      //FIm Pendência 23274
      FCdsPessoa.Post;
      Pessoa.CdsPessoa := FCdsPessoa;
      if bNovo then
      begin
        iIdPessoa := Pessoa.IncluirPessoa( True );
        bOk := ( iIdPessoa > 0 )
      end
      else
      begin
        iIdPessoa := FCdsDependente.FieldByName('IDPESSOA').AsInteger;
        bOk := Pessoa.AlterarPessoa( True );
      end;
      if not bOk then raise Exception.Create( Pessoa.MessageInfo );

      if ( not FCdsDependente.FieldByName( 'DATANASC' ).IsNull ) and
         ( FCdsDependente.FieldByName( 'DATANASC' ).AsDateTime > Now ) then
         raise Exception.Create( 'Data de nascimento não pode ser superior a data atual' );

      //Grava PESSOAFISICA
      FCdsPessoaFisica.FieldByName( 'IDPESSOA'         ).AsInteger    := iIdPessoa;
      FCdsPessoaFisica.FieldByName( 'SEXO'             ).AsString     := FCdsDependente.FieldByName( 'SEXO'             ).AsString;
      FCdsPessoaFisica.FieldByName( 'ESTCIVIL'         ).AsString     := FCdsDependente.FieldByName( 'ESTCIVIL'         ).AsString;
        if FCdsDependente.FieldByName( 'DATANASC' ).IsNull then
        FCdsPessoaFisica.FieldByName( 'DATANASC'       ).Clear
      else
        FCdsPessoaFisica.FieldByName( 'DATANASC'       ).AsDateTime   := FCdsDependente.FieldByName( 'DATANASC'         ).AsDateTime;
      FCdsPessoaFisica.FieldByName( 'NOMEPAI'          ).AsString     := FCdsDependente.FieldByName( 'NOMEPAI'          ).AsString;
      FCdsPessoaFisica.FieldByName( 'NOMEMAE'          ).AsString     := FCdsDependente.FieldByName( 'NOMEMAE'          ).AsString;
      FCdsPessoaFisica.FieldByName( 'IDGRINSTR'        ).AsString     := FCdsDependente.FieldByName( 'IDGRINSTR'        ).AsString;
      FCdsPessoaFisica.FieldByName( 'FLGISENTOIRRF'    ).AsInteger    := FCdsDependente.FieldByName( 'FLGISENTOIRRF'    ).AsInteger;
      FCdsPessoaFisica.FieldByName( 'FLGMOLESTIAGRAVE' ).AsInteger    := FCdsDependente.FieldByName( 'FLGMOLESTIAGRAVE' ).AsInteger;
      //Pendência 23274 - 28/12/2007
      if  FCdsDependente.FieldByName( 'DATAMORTE'       ).IsNull then
        FCdsPessoaFisica.FieldByName( 'DATAMORTE'       ).Clear
      else
        FCdsPessoaFisica.FieldByName( 'DATAMORTE'       ).AsDateTime  := FCdsDependente.FieldByName( 'DATAMORTE'        ).AsDateTime;
      //Fim Pendência 23274


      FCdsPessoaFisica.Post;
      PessoaFisica.CdsPessoaFisica := FCdsPessoaFisica;
      if bNovo then
        bOk := PessoaFisica.IncluirPessoaFisica( True )
      else
        bOk := PessoaFisica.AlterarPessoaFisica( True );
      if not bOk then raise Exception.Create( PessoaFisica.MessageInfo );
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      if FCdsDependente.FieldByName('FLGDEPINVALIDO').AsInteger = 1 then
         iIdSitDependente := 120
      else
         iIdSitDependente := 1;


      if bNovo then
      //Grava DEPENDENTE
      begin
        FCdsDependente.Edit;
        FCdsDependente.FieldByName('IDPESSOA').AsInteger  := iIdPessoa;
        FCdsDependente.Post;
        bOk := Self.IncluirDependente( True, iIdSitDependente );
        if not bOk then raise Exception.Create( MessageInfo );
      end
      else
      begin
        CmDebugToFile('Voltando','C:\AAErro.txt');
        FCdsDependente.Edit;
        FCdsDependente.FieldByName('IDPESSOA').AsInteger  := iIdPessoa;
        FCdsDependente.Post;
        bOk := Self.AlterarDependente( True, iIdSitDependente );
        if not bOk then raise Exception.Create( MessageInfo );
      end;
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354


      if bNovo then
      begin
        //Inclui DEPENTIT
        FCdsDepentit.Data := Depentit.SelecionaDepentit( -1, -1 );
        FCdsDepentit.Data := CopyClientDataSet( FCdsDepentit );
        FCdsDepentit.Insert;
        FCdsDepentit.FieldByName('IDPESSOA').AsInteger     := iIdPessoa;
        FCdsDepentit.FieldByName('IDTITULAR').AsInteger    := FCdsDependente.FieldByName('IDTITULAR').AsInteger;
        FCdsDepentit.FieldByName('NUMSEQUENCIA').AsInteger := ProximoSeq( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      end
      else
      begin
        //Altera DEPENTIT
        FCdsDepentit.Data := Depentit.SelecionaDepentit( iIdPessoa, FCdsDependente.FieldByName('IDTITULAR').AsInteger );
        FCdsDepentit.Data := CopyClientDataSet( FCdsDepentit );
        FCdsDepentit.Edit;
      end;

      //Grava DEPENTIT
      FCdsDepentit.FieldByName('IDDEPENDENCIA').AsString     := FCdsDependente.FieldByName('IDDEPENDENCIA').AsString;
      FCdsDepentit.FieldByName('FLGCONTAIMPOSTOR').AsInteger := FCdsDependente.FieldByName('FLGCONTAIMPOSTOR').AsInteger;
      FCdsDepentit.FieldByName('FLGCONTASALARIOF').AsInteger := FCdsDependente.FieldByName('FLGCONTASALARIOF').AsInteger;
      FCdsDepentit.FieldByName('FLGDESIGNADO').AsInteger     := FCdsDependente.FieldByName('FLGDESIGNADO').AsInteger;
      FCdsDepentit.FieldByName('FLGDEPLEGAL').AsInteger      := FCdsDependente.FieldByName('FLGDEPLEGAL').AsInteger;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      bTinhaImposto := (FCdsDepentit.FieldByName('FLGDEPIR').AsInteger = 1);
      FCdsDepentit.FieldByName('FLGDEPIR').AsInteger         := FCdsDependente.FieldByName('FLGDEPIR').AsInteger;
      FCdsDepentit.FieldByName('FLGDEPINVALIDO').AsInteger   := FCdsDependente.FieldByName('FLGDEPINVALIDO').AsInteger;
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      //CMDebugToFile(FCdsDepentit.FieldByName('IDDEPENDENCIA').AsString , 'C:\AAErro.txt' );
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      FCdsDepentit.FieldByName('DATACADASTRO').AsDateTime    := Date();

      if (not(bTinhaImposto) and (FCdsDepentit.FieldByName('FLGDEPIR').AsInteger = 1)) then begin
        FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsDateTime := Date();
      end;

      if (FCdsDepentit.FieldByName('FLGDEPIR').AsInteger = 0) and (bTinhaImposto) then begin
        FCdsDepentit.FieldByName('FIMIMPOSTOR').AsDateTime := Date();
      end;


      {if (bNovo) then begin
        if (FCdsDepentit.FieldByName('FLGDEPIR').AsInteger = 1) then begin
          FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsDateTime := Date();
        end;
      end else begin
        if (FCdsDepentit.FieldByName('FLGDEPIR').AsInteger = 0) and (bTinhaImposto) then begin
          FCdsDepentit.FieldByName('FIMIMPOSTOR').AsDateTime := Date();
        end;
      end;}
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354

      FCdsDepentit.Post;
      Depentit.CdsDepentit := FCdsDepentit;
      if bNovo then
        bOk := Depentit.IncluirDepentit( True )
      else
        bOk := Depentit.AlterarDepentit( True );
      if not bOk then raise Exception.Create( Depentit.MessageInfo );


      //Pendência 23274 - 28/12/2007
      //Grava DOCPESSOA
      FCdsParamGlobal.Data := ParamGlobal.ListaParamGlobal( iIdEmpresaProp );

      if FCdsParamGlobal.FieldByName('DOCPFISICA').AsInteger > 0 then
      begin

            FCdsTipoDocPessoa.Data := TipoDocPessoa.ListaTipoDocPessoa( FCdsParamGlobal.FieldByName('DOCPFISICA').AsInteger );

         if ( FCdsParamGlobal.FieldByName('FLGOBRIDOCPESSOA').AsString = 'S' ) or
            ( trim( FCdsDependente.FieldByName('NUMDOCUMENTO').AsString ) <> '' ) then begin

            ValidaDoc := TCMValidaDoc.Create(nil);
            ValidaDoc.NumDocumento := FCdsDependente.FieldByName('NUMDOCUMENTO').AsString;

            bOk := false;

            Case FCdsTipoDocPessoa.FieldByName('IDREGRA').AsInteger  Of
               -1: ValidaDoc.TipoDocumento := tdCGC;
               -2: ValidaDoc.TipoDocumento := tdCPF;
               -3: ValidaDoc.TipoDocumento := tdCUIT;
            Else
               bOk := True;
            End;

            If Not bOk Then
               bOk := ValidaDoc.DocumentoValido;

            ValidaDoc.Free;

            if not bOk then raise Exception.Create( 'Número de ' + Trim(FCdsTipoDocPessoa.FieldByName('NOMEDOCUMENTO').AsString) + ' Inválido' );

         end;

      end;

      if FCdsParamGlobal.FieldByName('DOCPFISICA').AsInteger > 0 then
      begin

         FCdsDocPessoa.Data := DocPessoa.SelecionaDocPessoa( iIdPessoa, 2 );

         bNovoDoc := ( FCdsDocPessoa.RecordCount <= 0 );

         if bNovo or bNovoDoc then
         begin
           //Inclui DOCPESSOA
           FCdsDocPessoa.Data := CopyClientDataSet( FCdsDocPessoa );
           FCdsDocPessoa.Insert;
           FCdsDocPessoa.FieldByName('IDPESSOA').AsInteger    := iIdPessoa;
           FCdsDocPessoa.FieldByName('IDDOCUMENTO').AsInteger := FCdsParamGlobal.FieldByName('DOCPFISICA').AsInteger;
         end
         else
         begin
           //Altera DOCPESSOA
           FCdsDocPessoa.Data := CopyClientDataSet( FCdsDocPessoa );
           FCdsDocPessoa.Edit;
         end;

         //Atualiza DOCPESSOA
         if trim( FCdsDependente.FieldByName('NUMDOCUMENTO').AsString ) <> '' then
         begin

           FCdsDocPessoa.FieldByName('NUMDOCUMENTO').AsString := trim( FCdsDependente.FieldByName('NUMDOCUMENTO').AsString );
         FCdsDocPessoa.Post;
         DocPessoa.CdsDocPessoa := FCdsDocPessoa;
         if bNovo or bNovoDoc then
           bOk := DocPessoa.IncluirDocPessoa( True )
         else
           bOk := DocPessoa.AlterarDocPessoa( True );
         if not bOk then raise Exception.Create( DocPessoa.MessageInfo );

         end
         else
         begin

           FCdsDocPessoa.Post;
           DocPessoa.CdsDocPessoa := FCdsDocPessoa;
           if not ( bNovo or bNovoDoc ) then
              bOk := DocPessoa.ExcluirDocPessoa( iIdPessoa, FCdsParamGlobal.FieldByName('DOCPFISICA').AsInteger, true );
           if not bOk then raise Exception.Create( DocPessoa.MessageInfo );

      end;

      end;
      //Fim Pendência 23274

      //Atualiza PESSOAFISICA (Titular)
      FCdsPessoaFisica.Data := PessoaFisica.SelecionaPessoaFisica( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.Data := CopyClientDataSet( FCdsPessoaFisica );
      FCdsPessoaFisica.Edit;
      FCdsPessoaFisica.FieldByName('NUMDEPTOT').AsInteger  := QtdeTotal( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.FieldByName('NUMDEPIRRF').AsInteger := QtdeIRRF( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.FieldByName('NUMDEPSALF').AsInteger := QtdeSalFamilia( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.Post;
      PessoaFisica.CdsPessoaFisica := FCdsPessoaFisica;
      bOk := PessoaFisica.AlterarTotais( True );
      if not bOk then raise Exception.Create( PessoaFisica.MessageInfo );

      FCdsPessoa.Close;
      FCdsPessoaFisica.Close;
      FCdsDepentit.Close;

      Commit;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      if (bRestauraDep) then begin
        RestauraDependente( FCdsDependente.FieldByName('IDTITULAR').AsInteger, FCdsCancelados.FieldByName('IDPESSOA').AsInteger );
      end;

      Result := iIdPessoa;

   except
     On E : Exception Do
     begin
       Result := 0;
       Rollback;
       MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrl_Dependente.OnCreateAppServer;
begin
  inherited;
  FCdsDependente := TCMClientDataSet.Create( nil );
end;

function TCtrl_Dependente.SelecionaDependente( iIdPessoa, iIdDependente : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select     p.IDPESSOA,                                                             ' +
   '            d.IDTITULAR,                                                            ' +
   '            p.NOME,                                                                 ' +
   '            dp.IDDEPENDENCIA,                                                       ' +
   '            dp.DESCRICAO,                                                           ' +
   '            pf.SEXO,                                                                ' +
   '            pf.ESTCIVIL,                                                            ' +
   '            decode( pf.ESTCIVIL, ''S'', ''Solteiro(a)'',                           ' +
   '            decode( pf.ESTCIVIL, ''C'', ''Casado(a)'',                             ' +
   '            decode( pf.ESTCIVIL, ''D'', ''Divorciado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''E'', ''Desquitado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''J'', ''Separado(a) Judicial'',                  ' +
   '            decode( pf.ESTCIVIL, ''V'', ''Viúvo(a)'',                              ' +
   '            decode( pf.ESTCIVIL, ''M'', ''Uniao Estavel'',                         ' +
   //'          decode( pf.ESTCIVIL, ''O'', ''Outros''))))) as ESTADOCIVIL,            ' +
   '            decode( pf.ESTCIVIL, ''P'', ''Separado(a)'')))))))) as ESTADOCIVIL,     ' +
   '            pf.DATANASC,                                                            ' +
   '            pf.NOMEPAI,                                                             ' +
   '            pf.NOMEMAE,                                                             ' +
   '            g.IDGRINSTR,                                                            ' +
   '            g.DESCRICAO as GRAUINSTR,                                               ' +
   //Pendência 23274 - 28/12/2007
   '            pf.DATAMORTE,                                                           ' +
   '            p.NUMDOCUMENTO,                                                         ' +
   '            td.MASCARA,                                                             ' +
   '            pg.FLGOBRIDOCPESSOA,                                                    ' +
   //Fim Pendência 23274
   '            pf.FLGISENTOIRRF,                                                       ' +
   '            d.INICIOIMPOSTOR,                                                       ' + //Fanuel Junior SOL164224 Kintana1419154
   '            d.DATACANCELA,                                                          ' + //Fanuel Junior SOL164224 Kintana1419154
   '            d.FLGCONTASALARIOF,                                                     ' +
   '            d.FLGCONTAIMPOSTOR,                                                     ' +
   '            d.FLGDEPLEGAL,                                                          ' +
   '            pf.FLGMOLESTIAGRAVE,                                                    ' +
   '            d.FLGDESIGNADO,                                                         ' +
   //BRUNO AZEVEDO SOL 141367 KINTANA 894033
   '            NVL(DEP.Idsitdependente,0) as Idsitdependente,                          ' +
   //BRUNO AZEVEDO SOL 141367 KINTANA 894033
   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   '            d.FLGDEPIR,                                                             ' +
   '            d.FLGDEPINVALIDO                                                       ' +
   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   ' from       DEPENTIT     d,                                                         ' +
   '            PESSOA       p,                                                         ' +
   '            DEPEN        dp,                                                        ' +
   '            PESSOAFISICA pf,                                                        ' +
   //Pendência 23274 - 28/12/2007
   '            PARAMGLOBAL pg,                                                         ' +
   '            TIPODOCPESSOA td,                                                       ' +
   '            GRINSTR      g,                                                          ' +
   '            DEPENDENTE   DEP                                                         ' + //BRUNO AZEVEDO SOL 141367 KINTANA 894033
   ' where      d.IDTITULAR     = ' + IntToStr( iIdPessoa )                               +
   '   and      d.IDPESSOA      = ' + IntToStr( iIdDependente )                           +
   '   and      pg.DOCPFISICA   = td.IDDOCUMENTO (+)                                    ' +
   //Fim Pendência 23274
   '   and      d.IDTITULAR     <> d.IDPESSOA                                           ' +
   '   and      DEP.IDPESSOA    = d.IDTITULAR                                            ' +  //BRUNO AZEVEDO SOL 141367 KINTANA 894033
   '   and      pf.DATAMORTE    is null                                                 ' +
   '   and      d.IDPESSOA      =  p.IDPESSOA                                           ' +
   '   and      d.IDDEPENDENCIA =  dp.IDDEPENDENCIA                                     ' +
   '   and      d.IDPESSOA      =  pf.IDPESSOA (+)                                      ' +
   '   and      pf.IDGRINSTR    =  g.IDGRINSTR (+)                                      ' );
end;

procedure TCtrl_Dependente.SetCdsDependente(
  const Value: TCMClientDataSet);
begin
  FCdsDependente := Value;
end;

procedure TCtrl_Dependente.SetDb_Dependente(
  const Value: TDb_Dependente);
begin
  FDb_Dependente := Value;
end;

function TCtrl_Dependente.SelecionaDependentes(
  iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select     p.IDPESSOA,                                                             ' +
   '            d.IDTITULAR,                                                            ' +
   '            p.NOME,                                                                 ' +
   '            dp.IDDEPENDENCIA,                                                       ' +
   '            dp.DESCRICAO,                                                           ' +
   '            pf.SEXO,                                                                ' +
   '            pf.ESTCIVIL,                                                            ' +
   '            decode( pf.ESTCIVIL, ''S'', ''Solteiro(a)'',                           ' +
   '            decode( pf.ESTCIVIL, ''C'', ''Casado(a)'',                             ' +
   '            decode( pf.ESTCIVIL, ''D'', ''Divorciado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''E'', ''Desquitado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''J'', ''Separado(a) Judicial'',                  ' +
   '            decode( pf.ESTCIVIL, ''V'', ''Viúvo(a)'',                              ' +
   '            decode( pf.ESTCIVIL, ''M'', ''Uniao Estavel'',                         ' +
   //'          decode( pf.ESTCIVIL, ''O'', ''Outros''))))) as ESTADOCIVIL,            ' +
   '            decode( pf.ESTCIVIL, ''P'', ''Separado(a)'')))))))) as ESTADOCIVIL,     ' +
   '            pf.DATANASC,                                                            ' +
   '            pf.NOMEPAI,                                                             ' +
   '            pf.NOMEMAE,                                                             ' +
   '            g.IDGRINSTR,                                                            ' +
   '            g.DESCRICAO as GRAUINSTR,                                               ' +
   //Pendência 23274 - 28/12/2007
   '            pf.DATAMORTE,                                                           ' +
   '            p.NUMDOCUMENTO,                                                         ' +
   '            td.MASCARA,                                                             ' +
   '            pg.FLGOBRIDOCPESSOA,                                                    ' +
   //Fim Pendência 23274
   '            pf.FLGISENTOIRRF,                                                       ' +
   '            d.FLGCONTASALARIOF,                                                     ' +
   '            d.FLGCONTAIMPOSTOR,                                                     ' +
   '            d.INICIOIMPOSTOR,                                                       ' +
   '            d.FLGDEPLEGAL,                                                          ' +
   '            pf.FLGMOLESTIAGRAVE,                                                    ' +
   '            d.FLGDESIGNADO,                                                         ' +
   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   '            d.FLGDEPIR,                                                             ' +
   '            d.FLGDEPINVALIDO                                                        ' +
   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   ' from       DEPENTIT     d,                                                         ' +
   '            PESSOA       p,                                                         ' +
   '            DEPEN        dp,                                                        ' +
   '            PESSOAFISICA pf,                                                        ' +
   //Pendência 23274 - 28/12/2007
   '            PARAMGLOBAL pg,                                                         ' +
   '            TIPODOCPESSOA td,                                                       ' +
   '            GRINSTR      g                                                          ' +
   ' where      d.IDTITULAR     = ' + IntToStr( iIdPessoa )                               +
   '   and      pg.IDPESSOA     = ' + IntToStr( iIdEmpresaProp )                          +
   '   and      pg.DOCPFISICA   = td.IDDOCUMENTO (+)                                    ' +
   //Fim Pendência 23274
   '   and      d.IDTITULAR     <> d.IDPESSOA                                           ' +
   '   and      pf.DATAMORTE    is null                                                 ' +
   '   and      d.IDPESSOA      =  p.IDPESSOA                                           ' +
   '   and      d.IDDEPENDENCIA =  dp.IDDEPENDENCIA                                     ' +
   '   and      d.IDPESSOA      =  pf.IDPESSOA (+)                                      ' +
   '   and      pf.IDGRINSTR    =  g.IDGRINSTR (+)                                      ' +
   '   and      d.DATACANCELA   is null                                                 ' );
end;

function TCtrl_Dependente.ListaDepen: OleVariant;
begin
  Result := GetDataPacket( ' select   IDDEPENDENCIA, ' +
                           '          DESCRICAO      ' +
                           '   from   DEPEN          ' +
                           //BRUNO AZEVEDO SOL 141367 KINTANA 894033
                           '  WHERE   IDDEPENDENCIA IN (''FIL'',''COM'',''PAI'',''COP'',''IRM'',''EXC'',''ENT'')' +
                           ' order by DESCRICAO      ' );
end;

function TCtrl_Dependente.ListaGrInstr: OleVariant;
begin
  Result := GetDataPacket( ' select   IDGRINSTR, ' +
                           '          DESCRICAO  ' +
                           '   from   GRINSTR    ' +
                           ' order by DESCRICAO  ' );
end;

procedure TCtrl_Dependente.SetCdsDepentit(const Value: TCMClientDataSet);
begin
  FCdsDepentit := Value;
end;

procedure TCtrl_Dependente.SetCdsPessoa(const Value: TCMClientDataSet);
begin
  FCdsPessoa := Value;
end;

// Pendência 23274 - 28/12/2007
procedure TCtrl_Dependente.SetCdsDocPessoa(const Value: TCMClientDataSet);
begin
  FCdsDocPessoa := Value;
end;

procedure TCtrl_Dependente.SetCdsParamGlobal(const Value: TCMClientDataSet);
begin
  FCdsParamGlobal := Value;
end;

procedure TCtrl_Dependente.SetDbParamGlobal(const Value: TDbParamGlobal);
begin
  FDbParamGlobal := Value;
end;

procedure TCtrl_Dependente.SetCdsTipoDocPessoa(const Value: TCMClientDataSet);
begin
  FCdsTipoDocPessoa := Value;
end;

procedure TCtrl_Dependente.SetDbTipoDocPessoa(const Value: TDbTipoDocPessoa);
begin
  FDbTipoDocPessoa := Value;
end;
// Fim Pendência 23274

procedure TCtrl_Dependente.SetCdsPessoaFisica(
  const Value: TCMClientDataSet);
begin
  FCdsPessoaFisica := Value;
end;

//BRUNO AZEVEDO SOL 124179 KINTANA 651468
function TCtrl_Dependente.CancelarDependente(): Boolean;
var
  sSQL : string;
  iIdPessoa, iIdTitular: Integer;
begin
  if ConnectionSide = cnsClient then
  begin
   // Result := Connection.AppServer.ExcluirPessoaFisica( iIdPessoa );
  //  if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      StartTransaction;


      //Fanuel Junior SOL164224 Kintana1419154 INICIO
      sSQL := ' update DEPENTIT set DATACANCELA = SYSDATE ';

      if (FCdsDependente.FieldByName('FLGDEPIR').AsInteger = 1) and
             (trim(FCdsDependente.FieldByName('INICIOIMPOSTOR').AsString ) <>  '') then
      begin
         sSQL := sSQL + ', FIMIMPOSTOR = SYSDATE ';

      end;
     { sSQL := ' update DEPENTIT set DATACANCELA = SYSDATE ' +
              ' where  IDPESSOA  = ' + IntToStr( FCdsDependente.FieldByName('IDPESSOA').AsInteger ) +
              ' and    IDTITULAR = ' + IntToStr( FCdsDependente.FieldByName('IDTITULAR').AsInteger ); }

      sSQL := sSQL + ' where  IDPESSOA  = ' + IntToStr( FCdsDependente.FieldByName('IDPESSOA').AsInteger ) +
                     ' and    IDTITULAR = ' + IntToStr( FCdsDependente.FieldByName('IDTITULAR').AsInteger );

      //Fanuel Junior SOL164224 Kintana1419154 FIM

      iIdPessoa  :=  FCdsDependente.FieldByName('IDPESSOA').AsInteger;
      iIdTitular :=  FCdsDependente.FieldByName('IDTITULAR').AsInteger;

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      Commit;

      //Fanuel Junior SOL164302 Kintana1419174 - inicio
      //cds.Data := Dependente.SelecionaDependente( iIdPessoaLocal, iIdDependente );
      CdsDependente.Data := SelecionaDependente( iIdTitular , iIdPessoa );

      //Dependente.CdsDependente.Data := cds.Data;
      //CMDebugToFile(FCdsDependente.FieldByName('DATACANCELA').AsString,'C:/AAErro.txt');
      GravaLogDependente(   iIdPessoa,
                            iIdTitular,
                            FCdsDependente, FCdsDependente,
                            opExcluir);

      //CMDebugToFile('Executou', 'C:/AAErro.txt');
      //Fanuel Junior SOL164302 Kintana1419174 - fim

   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;
//BRUNO AZEVEDO SOL 124179 KINTANA 651468

function TCtrl_Dependente.ExcluiDependente: Boolean;
var
  Msg : String;
  iIdPessoa, iIdTitular : integer;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarDependente( CdsDependente.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      FCdsPessoa.Close;
      FCdsPessoaFisica.Close;
      FCdsDepentit.Close;

      StartTransaction;

      iIdPessoa  := FCdsDependente.FieldByName('IDPESSOA').AsInteger;
      iIdTitular := FCdsDependente.FieldByName('IDTITULAR').AsInteger;


      //Exclui DEPENTIT
      Result := Depentit.ExcluirDepentit( iIdPessoa, iIdTitular, True );
      if not Result then raise Exception.Create( Depentit.MessageInfo );


      //Exclui DEPENDENTE
      Result := Self.ExcluirDependente( iIdPessoa, True );
      if not Result then raise Exception.Create( MessageInfo );


      //Pendência 23142 - 24/08/2006
      //Exclui DEPENDPESSOA
      Result := Pessoa.ExcluirDependPessoa( iIdPessoa, True );
      if not Result then raise Exception.Create( Pessoa.MessageInfo );
      //Fim Pendência 23142


      //Pendência 23274 - 28/12/2007
      //Grava DOCPESSOA
      Result := DocPessoa.ExcluirDocPessoa( iIdPessoa, -1, True );
      if not Result then raise Exception.Create( DocPessoa.MessageInfo );
      //Fim Pendência 23274


      //Exclui PESSOAFISICA
      Result := PessoaFisica.ExcluirPessoaFisica( iIdPessoa, True );
      if not Result then raise Exception.Create( PessoaFisica.MessageInfo );


      //Exclui PESSOA
      Result := Pessoa.ExcluirPessoa( iIdPessoa, True );
      if not Result then raise Exception.Create( Pessoa.MessageInfo );


      //Atualiza PESSOAFISICA (Titular)
      FCdsPessoaFisica.Data := PessoaFisica.SelecionaPessoaFisica( iIdTitular );
      FCdsPessoaFisica.Data := CopyClientDataSet( FCdsPessoaFisica );

      FCdsPessoaFisica.Edit;
      FCdsPessoaFisica.FieldByName('NUMDEPTOT').AsInteger  := QtdeTotal( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.FieldByName('NUMDEPIRRF').AsInteger := QtdeIRRF( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.FieldByName('NUMDEPSALF').AsInteger := QtdeSalFamilia( FCdsDependente.FieldByName('IDTITULAR').AsInteger );
      FCdsPessoaFisica.Post;
      PessoaFisica.CdsPessoaFisica := FCdsPessoaFisica;
      Result := PessoaFisica.AlterarTotais( True );
      if not Result then raise Exception.Create( PessoaFisica.MessageInfo );

      FCdsPessoa.Close;
      FCdsPessoaFisica.Close;
      FCdsDepentit.Close;

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;

end;


function TCtrl_Dependente.QtdeTotal( iIdTitular : integer ) : integer;
var
  cdsTotal : TCMClientDataSet;
begin
  cdsTotal := TCMClientDataSet.Create( nil );
  try
    cdsTotal.Data := GetDataPacket( ' select count(*) as TOTAL                    ' +
                                    '   from DEPENTIT                             ' +
                                    '  where IDTITULAR = ' + IntToStr( iIdTitular ) +
                                    '    and IDPESSOA  <> IDTITULAR               ' );

    Result := cdsTotal.FieldByName('TOTAL').AsInteger;
  finally
    cdsTotal.Free;
  end;
end;

function TCtrl_Dependente.QtdeIRRF(iIdTitular: integer): integer;
var
  cdsTotal : TCMClientDataSet;
begin
  cdsTotal := TCMClientDataSet.Create( nil );
  try
    cdsTotal.Data := GetDataPacket( ' select count(*) as TOTAL                           ' +
                                    '   from DEPENTIT                                    ' +
                                    '  where IDTITULAR        = ' + IntToStr( iIdTitular ) +
                                    '    and FLGCONTAIMPOSTOR = ''1''                    ' +
                                    '    and IDPESSOA  <> IDTITULAR                      ' );

    Result := cdsTotal.FieldByName('TOTAL').AsInteger;
  finally
    cdsTotal.Free;
  end;
end;

function TCtrl_Dependente.QtdeSalFamilia(iIdTitular: integer): integer;
var
  cdsTotal : TCMClientDataSet;
begin
  cdsTotal := TCMClientDataSet.Create( nil );
  try
    cdsTotal.Data := GetDataPacket( ' select count(*) as TOTAL                           ' +
                                    '   from DEPENTIT                                    ' +
                                    '  where IDTITULAR        = ' + IntToStr( iIdTitular ) +
                                    '    and FLGCONTASALARIOF = ''1''                    ' +
                                    '    and IDPESSOA  <> IDTITULAR                      ' );

    Result := cdsTotal.FieldByName('TOTAL').AsInteger;
  finally
    cdsTotal.Free;
  end;
end;

function TCtrl_Dependente.ProximoSeq(iIdTitular: integer): integer;
var
  cdsProx : TCMClientDataSet;
begin
  cdsProx := TCMClientDataSet.Create( nil );
  try
    cdsProx.Data := GetDataPacket( ' select nvl( max( NUMSEQUENCIA ), 0 ) + 1 as PROX   ' +
                                   '   from DEPENTIT                                    ' +
                                   '  where IDTITULAR        = ' + IntToStr( iIdTitular ) +
                                   '    and IDPESSOA  <> IDTITULAR                      ' );                                   

    Result := cdsProx.FieldByName('PROX').AsInteger;
  finally
    cdsProx.Free;
  end;
end;

function TCtrl_Dependente.ExcluirDependente( iIdPessoa: integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirPessoaFisica( iIdPessoa );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from DEPENDENTE  ' +
              ' where  IDPESSOA  = ' + IntToStr( iIdPessoa );

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

//BRUNO AZEVEDO SOL 144873 KINTANA 961354
function TCtrl_Dependente.AlterarDependente( bEmTransacao : boolean; iIdSitDependente : integer ): boolean;
var
  sSQL : string;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarDependente( FCdsDependente.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' UPDATE DEPENDENTE   '+
              ' SET IDSITDEPENDENTE = '+IntToStr(iIdSitDependente) +' '+
              ' WHERE IDPESSOA =  '+FCdsDependente.FieldByName('IDPESSOA').AsString;


    {  sSQL := ' insert into DEPENDENTE      ' +
              ' (           IDPESSOA ,      ' +
              '      IDSITDEPENDENTE ,      ' +
              ' ) values (                  ' +
              FCdsDependente.FieldByName('IDPESSOA').AsString + ', '
              IntToStr(iIdSitDependente)+
              ' ) ';   }

      Result := ExecSQL( sSQL );
      CMDebugToFile(sSQL, 'C:\AAErro.txt' );

      if not Result then raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

    except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;




function TCtrl_Dependente.IncluirDependente( bEmTransacao : boolean; iIdSitDependente : integer ): boolean;
var
  sSQL : string;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluirDependente( FCdsDependente.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      sSQL := ' insert into DEPENDENTE      ' +
              ' (           IDPESSOA ,      ' +
              '      IDSITDEPENDENTE       ' +
              ' ) values ( ' +
              FCdsDependente.FieldByName('IDPESSOA').AsString + ', ' +
              IntToStr(iIdSitDependente)+
              ' ) ';
      CMDebugToFile(sSQL, 'C:\AAErro.txt' );
      Result := ExecSQL( sSQL );

      if not Result then raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

    except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrl_Dependente.CancelaDependente( iIdTitular, iIdDependente: integer ) : boolean;
var
  sSQL : string;
  cdsPF, cdsDep, cdsAux : TCMClientDataset;
begin

  cdsPF  := TCMClientDataset.Create( nil );
  cdsDep := TCMClientDataset.Create( nil );
  cdsAux := TCMClientDataset.Create( nil );
  try

    try

      cdsPF.Data := GetDataPacket(
       ' SELECT PF.NUMDEPIRRF,  ' +
       '        PF.NUMDEPSALF,  ' +
       '        PF.NUMDEPTOT    ' +
       ' FROM   PESSOAFISICA PF ' +
       ' WHERE  PF.IDPESSOA =   ' + IntToStr( iIdTitular ) );

      cdsDep.Data := GetDataPacket(
       '  SELECT P.NOME, ' +
       '         P.IDPESSOA, ' +
       '         P.NUMDOCUMENTO, ' +
       '         D.IDTITULAR, ' +
       '         DP.DESCRICAO AS TIPODEPENDENCIA, ' +
       '         D.NUMSEQUENCIA, ' +
       '         D.FLGCONTAIMPOSTOR, ' +
       '         D.FLGCONTASALARIOF, ' +
       '         D.DATACADASTRO, ' +
       '         D.DATACANCELA, ' +
       '         D.FLGDESIGNADO, ' +
       '         D.FLGDEPLEGAL, ' +
       '         D.IDDEPENDENCIA, ' +
       '         D.MATRICULA, ' +
       '         D.INICIOIMPOSTOR, ' +
       '         D.FIMIMPOSTOR, ' +
       '         D.INICIOSALARIOF, ' +
       '         D.FIMSALARIOF, ' +
       '         0 AS FLGELEGIVEL, ' +
       '         VALORBASE1, ' +
       '         VALORBASE2, ' +
       '         VALORBASE3 ' +
       '  FROM   PESSOA P, DEPEN DP, DEPENDENTE DEP, DEPENTIT D ' +
       '  WHERE  D.IDTITULAR     = ' + IntToStr( iIdTitular ) +
       '  AND    D.IDPESSOA      = ' + IntToStr( iIdDependente ) +
       '  AND    D.IDDEPENDENCIA <> ''PRP'' ' +
       '  AND    D.IDPESSOA      = P.IDPESSOA ' +
       '  AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA ' +
       '  AND    DEP.IDPESSOA    = D.IDPESSOA ' +
       '  ORDER BY D.NUMSEQUENCIA ' );

      //Verificar se o dependente recebe beneficios
      cdsAux.Data := GetDataPacket(
       ' SELECT B.NOME, S.DESCRICAO AS SITUACAO ' +
       ' FROM   BENEFBFCIARIO BF, BENEFICIO B, SITBENEFICIO S '+
       ' WHERE  BF.IDTITULAR = ' + IntToStr( iIdTitular ) +
       ' AND    BF.IDPESSOA  = ' + IntToStr( iIdDependente ) +
       ' AND    ((BF.DATAFINAL IS NULL) OR (BF.DATAFINAL >= SYSDATE)) ' +
       ' AND    B.IDBENEFICIO = BF.IDBENEFICIO ' +
       ' AND    S.IDSITBENEFICIO = BF.IDSITBENEFICIO ' );

      if not cdsAux.IsEmpty then
      begin
        Result := False;
        raise Exception.Create( 'O dependente '+ cdsDep.FieldByName('NOME').AsString+ ' possui o benefício '+
         cdsAux.FieldByName('NOME').AsString + ' com situação de ' + cdsAux.FieldByName('SITUACAO').AsString + '.' + #13#10 +
         'O encerramento de benefícios deve ser executado antes do cancelamento do dependente.' );
      end;

      StartTransaction;

      ExecSQL( ' UPDATE DEPENTIT ' +
               ' SET    DATACANCELA = SYSDATE, ' +
               '        FIMIMPOSTOR = SYSDATE, ' +
               '        FLGCONTAIMPOSTOR = 0,  ' +
               '        FIMSALARIOF = SYSDATE, ' +
               '        FLGCONTASALARIOF = 0   ' +
               ' WHERE  IDTITULAR = ' + cdsDep.FieldByName('IDTITULAR').AsString +
               '   AND  IDPESSOA  = ' + cdsDep.FieldByName('IDPESSOA').AsString );

      ExecSQL( ' UPDATE DEPENDENTE ' +
               ' SET    IDSITDEPENDENTE = NULL ' +
               ' WHERE  IDPESSOA  = ' + cdsDep.FieldByName('IDPESSOA').AsString );

      sSQL := '';

      if cdsPF.FieldByName('NUMDEPTOT').AsInteger >= 1 then
      begin
        if Trim( sSQL ) = '' then
          sSQL := ' NUMDEPTOT = NUMDEPTOT - 1 '
        else
         sSQL := sSQL + ' , NUMDEPTOT = NUMDEPTOT - 1 ';
      end;

      if cdsPF.FieldByName('NUMDEPSALF').AsInteger >= 1 then
      begin
        if Trim( sSQL ) = '' then
          sSQL := ' NUMDEPSALF = NUMDEPSALF - 1 '
        else
          sSQL := sSQL + ' , NUMDEPSALF = NUMDEPSALF - 1 ';
      end;

      if cdsPF.FieldByName('NUMDEPIRRF').AsInteger >= 1 then
      begin
        if Trim( sSQL ) = '' then
          sSQL := ' NUMDEPIRRF = NUMDEPIRRF - 1 '
        else
          sSQL := sSQL + ' , NUMDEPIRRF = NUMDEPIRRF - 1 ';
      end;

      if trim( sSQL ) <> '' then
        ExecSQL( ' UPDATE PESSOAFISICA ' +
         ' SET    ' + sSQL +
         ' WHERE  IDPESSOA = ' + cdsDep.FieldByName('IDTITULAR').AsString );

      Commit;

      Result := True;

    except
      On E : Exception Do
      begin
        if InTransaction then Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;

  finally
    cdsPF.Free;
    cdsAux.Free;
    cdsDep.Free;
  end;

end;

function TCtrl_Dependente.DependentesCancelados( iIdTitular : integer ) : OleVariant;
begin
  Result := GetDataPacket(
    ' select p.NOME,                                ' +
    '        TRIM(p.NUMDOCUMENTO) AS NUMDOCUMENTO,  ' +
    '        d.IDPESSOA,                            ' +
    '        pf.DATANASC,                           ' +
    '        d.DATACANCELA                          ' +
    ' from   DEPENTIT d,                            ' +
    '        PESSOAFISICA pf,                       ' +
    '        PESSOA   p                             ' +
    ' where  d.IDPESSOA  =  p.IDPESSOA              ' +
    '   and  d.IDPESSOA  <> d.IDTITULAR             ' +
    '   and  d.IDPESSOA  =  pf.IDPESSOA (+)         ' +
    '   and  d.IDPESSOA  <> d.IDTITULAR             ' +
    '   and  d.DATACANCELA is not null              ' +
    '   and  d.IDTITULAR = ' + IntToStr( iIdTitular ) +
    ' order  by p.NOME                              ' );
end;


function TCtrl_Dependente.RestauraDependente( iIdTitular, iIdDependente : integer ) : boolean;
var
  cdsPF, cdsDep, cdsAux : TCMClientDataset;
begin

  cdsPF  := TCMClientDataset.Create( nil );
  cdsDep := TCMClientDataset.Create( nil );
  cdsAux := TCMClientDataset.Create( nil );
  try

    try

      cdsPF.Data := GetDataPacket(
       ' SELECT PF.NUMDEPIRRF,  ' +
       '        PF.NUMDEPSALF,  ' +
       '        PF.NUMDEPTOT    ' +
       ' FROM   PESSOAFISICA PF ' +
       ' WHERE  PF.IDPESSOA =   ' + IntToStr( iIdTitular ) );

      cdsDep.Data := GetDataPacket(
       '  SELECT P.NOME, ' +
       '         P.IDPESSOA, ' +
       '         P.NUMDOCUMENTO, ' +
       '         D.IDTITULAR, ' +
       '         DP.DESCRICAO AS TIPODEPENDENCIA, ' +
       '         D.NUMSEQUENCIA, ' +
       '         D.FLGCONTAIMPOSTOR, ' +
       '         D.FLGCONTASALARIOF, ' +
       '         D.DATACADASTRO, ' +
       '         D.DATACANCELA, ' +
       '         D.FLGDESIGNADO, ' +
       '         D.FLGDEPLEGAL, ' +
       '         D.IDDEPENDENCIA, ' +
       '         D.MATRICULA, ' +
       '         D.INICIOIMPOSTOR, ' +
       '         D.FIMIMPOSTOR, ' +
       '         D.INICIOSALARIOF, ' +
       '         D.FIMSALARIOF, ' +
       '         0 AS FLGELEGIVEL, ' +
       '         VALORBASE1, ' +
       '         VALORBASE2, ' +
       '         VALORBASE3 ' +
       '  FROM   PESSOA P, DEPEN DP, DEPENDENTE DEP, DEPENTIT D ' +
       '  WHERE  D.IDTITULAR     = ' + IntToStr( iIdTitular ) +
       '  AND    D.IDPESSOA      = ' + IntToStr( iIdDependente ) +
       '  AND    D.IDDEPENDENCIA <> ''PRP'' ' +
       '  AND    D.IDPESSOA      = P.IDPESSOA ' +
       '  AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA ' +
       '  AND    DEP.IDPESSOA    = D.IDPESSOA ' +
       '  ORDER BY D.NUMSEQUENCIA ' );

      //StartTransaction;

      ExecSQL( ' UPDATE DEPENTIT ' +
               ' SET    DATACANCELA = NULL ' +
               ' WHERE  IDTITULAR = ' + cdsDep.FieldByName('IDTITULAR').AsString +
               '   AND  IDPESSOA  = ' + cdsDep.FieldByName('IDPESSOA').AsString );

   {   ExecSQL( ' UPDATE DEPENDENTE ' +
               ' SET    IDSITDEPENDENTE = NULL ' +
               ' WHERE  IDPESSOA  = ' + cdsDep.FieldByName('IDPESSOA').AsString ); }

      ExecSQL( ' UPDATE PESSOAFISICA ' +
       ' SET   NUMDEPTOT = NUMDEPTOT + 1 ' +
       ' WHERE  IDPESSOA = ' + cdsDep.FieldByName('IDTITULAR').AsString );

      //Commit;

      Result := True;

    except
      On E : Exception Do
      begin
        if InTransaction then Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;

  finally
    cdsPF.Free;
    cdsAux.Free;
    cdsDep.Free;
  end;

end;

//BRUNO AZEVEDO SOL 143967 KINTANA 942327
procedure TCtrl_Dependente.GravaLogDependente(pIdPessoa, pIdTitular: Integer; xDataSet, xDataSetAnt: TCMClientDataSet; pTipo: TOperacao);
var
  i: Integer;
  sSql: String;
begin
  if (pTipo = opInserir) then begin
    for i := 0 to xDataSet.Fields.Count - 1 do begin
      //StartTransaction;
      sSql := 'INSERT INTO LOGALTDEPENDENTES ' +
              '(IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
              ' VALUES ' +
              '(' + IntToStr(pIdPessoa) + ',' + IntToStr(pIdTitular) + ',''INCLUSÃO'',' +QuotedStr(xDataSet.Fields[i].FieldName)+ ','''',' + QuotedStr(xDataSet.Fields[i].AsString) + ',USER,SYSDATE)';
      ExecSQL(sSql);
      //Commit;
    end;
  end else if (pTipo = opAlterar) then begin
    for i := 0 to xDataSet.Fields.Count - 1 do begin
      //StartTransaction;
      sSql := 'INSERT INTO LOGALTDEPENDENTES ' +
              '(IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
              ' VALUES ' +
              '(' + IntToStr(pIdPessoa) + ',' + IntToStr(pIdTitular) + ',''ALTERAÇÃO'',' +QuotedStr(xDataSet.Fields[i].FieldName) + ',' + QuotedStr(xDataSetAnt.FieldByName(xDataSet.Fields[i].FieldName).AsString) + ',' + QuotedStr(xDataSet.Fields[i].AsString) + ',USER,SYSDATE)';
      ExecSQL(sSql);
      //Commit;
    end;
    //end;
  //Quando cancelar
  //Fanuel Junior SOL164302 Kintana1419174
  end else if (pTipo = opExcluir) then begin
     StartTransaction;
           sSql := 'INSERT INTO LOGALTDEPENDENTES ' +
              '(IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
              ' VALUES ' +
              '('+IntToStr(pIdPessoa) + ',' + IntToStr(pIdTitular) + ',''ALTERAÇÃO'',''DATACANCELA'' ,'+''''''+','+QuotedStr(xDataSet.FieldByName('DATACANCELA').AsString)+',USER,SYSDATE)';
      CMDEbugToFile(sSql,'C:/AAErro.txt');
      ExecSQL(sSql);
     Commit;
  end;


end;
//BRUNO AZEVEDO SOL 143967 KINTANA 942327







end.


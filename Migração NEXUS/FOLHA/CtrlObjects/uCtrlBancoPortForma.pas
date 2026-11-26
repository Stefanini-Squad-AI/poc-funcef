// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//--------------------------------------------------------------------------------
//Alteração  : DefinePortadorForma
//Nº SIG.....: 123059
//Data.......: 09/02/2022
//Responsável: Andre Imakawa
//Descrição..: Não validar Conta para portador forma 308, 309 e 310
//--------------------------------------------------------------------------------
//Pendência   : SIG 79100
//Responsável : André Imakawa
//Data        : 05/07/2021
//Descrição   : alterar Join com tabela Pessoa em vez de PESSOAFISICA
//--------------------------------------------------------------------------------
//Pendência   : SIG 115336
//Responsável : André Imakawa
//Data        : 14/04/2021
//Descrição   : Ajuste para melhoria de performance no banco de dados.
//--------------------------------------------------------------------------------
//Pendência   : SIG 115253
//Responsável : André Imakawa
//Data        : 13/04/2021
//Descrição   : Ajuste para melhoria de performance no banco de dados.
//--------------------------------------------------------------------------------
//Pendência   : SIG 35803
//Responsável : André Imakawa
//Data        : 08/11/2017
//Descrição   : Recuperar dados bancarios mesmo quando não existe CodPortforma parametrizado
//--------------------------------------------------------------------------------
//Pendência   : SOL 252160 - KINTANA 749995
//Responsável : BRUNO AZEVEDO
//Data        : 13/04/2015
//Descrição   : QUANDO FOR RESGATE, NÃO PRECISA VER CONTA PREFERENCIAL, SOMENTE VERIFICAR AS CONTAS DE RESGATE
//              INFORMAÇÃO OBTIDA E ALINHADA COM O ANDERSON E COM O LEANDRO
//--------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : BRUNO AZEVEDO
//Data        : 12/01/2012
//Descrição   : Carregar a conta de resgate.
//--------------------------------------------------------------------------------
//Pendência   : SOL 138251 kintana 840758
//Responsável : Renato Visoni
//Descrição   : Ajuste para quando o lote for de resgate pegar a conta Resgate.
//--------------------------------------------------------------------------------
//Pendência   : SOL 133891 KINTANA 783366
//Responsável : BRUNO AZEVEDO
//Data        : 12/04/2010
//Descrição   : Buscar a conta de pensão alimenticia como preferencial, caso nao
//              encontre, buscar a conta salário.
//--------------------------------------------------------------------------------
//  Autor(a)   : Daniel Begnami
//  Rotina     : DefinePortadorForma
//  Data       : 09.07.2009
//  Pendencia  : 111915
//  Alteração  : Foi alterado a conta de conta PREFERENCIAL para conta SALAÁRIO (TIPOCONTA = 2).
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 06.03.2006
//  Pendencia  : 21346
//  Alteração  : Criar tipo de conta OP, para a qual não é obrigatório
//               informar a conta corrente. Definir portador específico.
//------------------------------------------------------------------------------
unit uCtrlBancoPortForma;

interface

Uses Classes, SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     Wwquery, Db, uDatabase, DBClient, DBaseDados, DFolha, DBTables,
     uConstFolha, uAdmPrevFB, uObjFolha, ucmfileutils;

type

  tObjPortadorForma = class
  private
    FCodPortforma: integer;
    FFavorecido: integer;
    FBanco: integer;
    FSituacao: string;
    FTipoFolha: string;
    FTipoConta: string;
    FDmaisAlt: integer;
    FCodFormaPgtoAlt: integer;
    FValorMaximo: real;
    procedure SetBanco(const Value: integer);
    procedure SetCodPortforma(const Value: integer);
    procedure SetFavorecido(const Value: integer);
    procedure SetSituacao(const Value: string);
    procedure SetTipoConta(const Value: string);
    procedure SetTipoFolha(const Value: string);
    procedure SetCodFormaPgtoAlt(const Value: integer);
    procedure SetDmaisAlt(const Value: integer);
    procedure SetValorMaximo(const Value: real);
  public
    property TipoConta: string read FTipoConta write SetTipoConta;
    property TipoFolha: string read FTipoFolha write SetTipoFolha;
    property Situacao: string read FSituacao write SetSituacao;
    property CodPortforma: integer read FCodPortforma write SetCodPortforma;
    property Banco: integer read FBanco write SetBanco;
    property Favorecido: integer read FFavorecido write SetFavorecido;
    property ValorMaximo: real read FValorMaximo write SetValorMaximo;
    property CodFormaPgtoAlt: integer read FCodFormaPgtoAlt write SetCodFormaPgtoAlt;
    property DMaisAlt: integer read FDmaisAlt write SetDmaisAlt;
  end;

  tCtrlBancoPortForma = class(TCmControlObject)
  private
    lstNormal: tstringlist;
    lstExtra: tstringlist;
    lstReserva: tstringlist;
    lstProvisorio: tstringlist;
    FcdsAux: TCMClientDataSet;
    procedure CriaObjBancoPortForma(
      var alista: tstringlist;
      asTipoConta: string;
      asTipoFolha: string;
      asSituacao: string;
      aiCodPortforma: integer;
      aiBanco: integer;
      aiFavorecido: integer;
      arValorMaximo: real;
      aiCodFormaPgtoAlt: integer;
      aiDMaisAlt: integer);
    procedure SetcdsAux(const Value: TCMClientDataSet);
    function ExisteCodPortformaLista(alista: tstringlist;
      aicodportforma: integer;
      aidfavorecido: integer; //ACHA PORTADOR COM MESMO FAVORECIDO
      abchecafav: boolean; 
      var aobjbcp: tObjPortadorForma): boolean;
    function ExistePortadorFavorecidoLista(alista: tstringlist;
      var aobjbcp: tObjPortadorForma): boolean;
    function ExistePortadorContaLista(alista: tstringlist;
      aiidbanco: integer; 
      //TRATAMENTO DO PORTADOR FORMA PARA TIPO CONTA TEM QUE SER VINCULADO AO BANCO
      astipocontarec: string; //TESTE TIPO OP/Recibo
      var aobjbcp: tObjPortadorForma): boolean;
    function ExistePortadorBancoLista(alista: tstringlist;
      aibanco: integer; var aobjbcp: tObjPortadorForma): boolean;
    function ExistePortadorPadraoLista(alista: tstringlist;
      var aobjbcp: tObjPortadorForma): boolean;
  protected
  public
    constructor Create; override;
    destructor Destroy; override;
    property cdsAux: TCMClientDataSet read FcdsAux write SetcdsAux;
    function Inicializa(aidfundacao: integer): boolean;
    function DefinePortadorForma(aiidtitular, aiidrecebedor,
      aiidpatro,
      aitipofolha,
      aiflgprovisorio, aiflgfavorecido, aicodportparticip,
      aiflgreserva: integer;
      var asnumbanco, asnumagencia, asnomeagencia, asnumconta,
      astipoconta, asidcbancaria: string;
      var abpagtoelet, abDuplContaPref: boolean;
      //FAVORECIDO INDICADO NA BANCOPORTFORMA
      var aidfavorecido: integer;
      arValorLiquido: real;
      var aiseqdoc: integer;
      var aobjPortadorForma: tObjPortadorForma
      ;aiIdLote : Integer = -1): integer;//Renato Visoni SOL 138251 kintana 840758

    function DefineSeqDocumento(arValorLiquido: real;
      aobjPortadorForma: tObjPortadorForma): integer;
  end;

implementation

{ tObjPortadorForma }

procedure tObjPortadorForma.SetBanco(const Value: integer);
begin
  FBanco := Value;
end;

procedure tObjPortadorForma.SetCodFormaPgtoAlt(const Value: integer);
begin
  FCodFormaPgtoAlt := Value;
end;

procedure tObjPortadorForma.SetCodPortforma(const Value: integer);
begin
  FCodPortforma := Value;
end;

procedure tObjPortadorForma.SetDmaisAlt(const Value: integer);
begin
  FDmaisAlt := Value;
end;

procedure tObjPortadorForma.SetFavorecido(const Value: integer);
begin
  FFavorecido := Value;
end;

procedure tObjPortadorForma.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure tObjPortadorForma.SetTipoConta(const Value: string);
begin
  FTipoConta := Value;
end;

procedure tObjPortadorForma.SetTipoFolha(const Value: string);
begin
  FTipoFolha := Value;
end;

procedure tObjPortadorForma.SetValorMaximo(const Value: real);
begin
  FValorMaximo := Value;
end;

{ tCtrlBancoPortForma }

constructor tCtrlBancoPortForma.Create;
begin
  inherited;
  fcdsAux:=TCMClientDataSet.Create(Nil);
end;

procedure tCtrlBancoPortForma.CriaObjBancoPortForma(
  var alista: tstringlist;
  asTipoConta, asTipoFolha, asSituacao: string; aiCodPortforma, aiBanco,
  aiFavorecido: integer;
  arValorMaximo: real;
  aiCodFormaPgtoAlt: integer;
  aiDMaisAlt: integer);
var objport: tObjPortadorForma;
begin
  if not assigned(alista) then
    alista:=tstringlist.create;
  objPort:=tObjPortadorForma.create;
  objPort.TipoConta:=asTipoConta;
  objPort.TipoFolha:=asTipoFolha;
  objPort.Situacao:=asSituacao;
  objPort.CodPortforma:=aiCodPortforma;
  objPort.Banco:=aiBanco;
  objPort.Favorecido:=aiFavorecido;
  objPort.ValorMaximo:=arValorMaximo;
  objPort.CodFormaPgtoAlt:=aiCodFormaPgtoAlt;
  objPort.DMaisAlt:=aiDMaisAlt;
  alista.AddObject(inttostr(alista.count+1),objPort);
end;

function tCtrlBancoPortForma.DefinePortadorForma(aiidtitular,
  aiidrecebedor, aiidpatro, aitipofolha, aiflgprovisorio, aiflgfavorecido,
  aicodportparticip, aiflgreserva: integer; var asnumbanco, asnumagencia,
  asnomeagencia, asnumconta, astipoconta, asidcbancaria: string;
  var abpagtoelet, abDuplContaPref: boolean;
  var aidfavorecido: integer;
  arValorLiquido: real;
  var aiseqdoc: integer;
  var aobjPortadorForma: tObjPortadorForma
  ;aiIdLote : Integer = -1): integer;//Renato Visoni SOL 138251 kintana 840758
var ssql,
    stipocontainterno: string;
    iidbanco, icodportforma: integer;
    llistabcp: tstringlist;
    lobjbcp: tObjPortadorForma;

  function PegaDadosBancarios: integer;
  var
     bResgate: Boolean;
     bResgateParc: Boolean;
     qryaux:TwwQuery;       // Andre Imakawa - SIG 115253
  begin
    try
      // Andre Imakawa - SIG 115253 - Inicio
      qryaux := TwwQuery.Create(nil);
      qryaux.DataBaseName := 'BaseDados';
      qryaux.Close;
      qryaux.SQl.Clear;
      // Andre Imakawa - SIG 115253 - Fim
      
      result:=-1;
      abDuplContaPref:=false;
      bResgate := False;
      bResgateParc := false;

      //Renato Visoni SOL 138251 kintana 840758
      sSQL := ' SELECT * FROM CTRLINTERFACE WHERE IDLOTE = ' + intTostr(aiIdLote) +' AND NVL(FLGRESGATE,1)=1';
      fcdsAux.Data := GetDataPacket(ssql);
      //BRUNO AZEVEDO SOL 63067 KINTANA
      bResgate := not (FcdsAux.IsEmpty);

      //BRUNO AZEVEDO SOL 63067 KINTANA
      if (bResgate = False) then begin
        sSQL := ' SELECT * FROM CTRLINTERFACE WHERE IDLOTE = ' + intTostr(aiIdLote) +' AND NVL(FLGRESGATEPARCELADO,1)=1';
        fcdsAux.Data := GetDataPacket(ssql);
        bResgateParc := not (FcdsAux.IsEmpty);
      end;

      if bResgateParc then
      begin
          //É lote de resgate parcelado.
            sSQL := ' SELECT * FROM (        '+
                    ' SELECT AGB.IDBANCO,    '+
                    '     CTB.CONTACORRENTE, '+
                    '     CTB.TIPOCONTA,     '+
                    '     CTB.IDCBANCARIA,   '+
                    '     AGB.NUMAGENCIA,    '+
                    '     BCO.NUMBANCO,      '+
                    '     AGP.NOME AS NOMEAGENCIA '+
                    ' FROM CONTABANCARIA CTB, AGENCIABANCARIA AGB, BANCO BCO, PESSOA AGP '+
                    ' WHERE (CTB.IDPESSOA ='+inttostr(aiidrecebedor)+' )                 '+
                    ' AND (NVL(CTB.FLGCONTARESGATE,0)=1)         '+
                    ' AND (AGB.IDPESSOA(+) = CTB.IDAGENCIA)                              '+
                    ' AND (BCO.IDPESSOA(+) = AGB.IDBANCO)                                '+
                    ' AND (AGP.IDPESSOA(+) = AGB.IDPESSOA)                               '+
                    ' ORDER BY CTB.FLGCONTARESGATE DESC ) WHERE ROWNUM =1                ';

            fcdsAux.Data := GetDataPacket(ssql);
      end
      else
      begin
          //BRUNO AZEVEDO SOL 63067 KINTANA
          if (bResgate) then begin
          //É lote de resgate.
            sSQL := ' SELECT * FROM (        '+
                    ' SELECT AGB.IDBANCO,    '+
                    '     CTB.CONTACORRENTE, '+
                    '     CTB.TIPOCONTA,     '+
                    '     CTB.IDCBANCARIA,   '+
                    '     AGB.NUMAGENCIA,    '+
                    '     BCO.NUMBANCO,      '+
                    '     AGP.NOME AS NOMEAGENCIA '+
                    ' FROM CONTABANCARIA CTB, AGENCIABANCARIA AGB, BANCO BCO, PESSOA AGP '+
                    ' WHERE (CTB.IDPESSOA ='+inttostr(aiidrecebedor)+' )                 '+
                    //BRUNO AZEVEDO SOL 252160 KINTANA 749995
                    //QUANDO FOR RESGATE, NÃO PRECISA VER CONTA PREFERENCIAL, SOMENTE VERIFICAR AS CONTAS DE RESGATE
                    //INFORMAÇÃO OBTIDA E ALINHADA COM O ANDERSON E COM O LEANDRO
                    ' AND (NVL(CTB.FLGCONTARESGATE,0)=1)                                 '+
                    //' AND (CTB.FLGCONTAPREF = 1 OR NVL(CTB.FLGCONTARESGATE,0)=1)       '+
                    //BRUNO AZEVEDO SOL 252160 KINTANA 749995
                    ' AND (AGB.IDPESSOA(+) = CTB.IDAGENCIA)                              '+
                    ' AND (BCO.IDPESSOA(+) = AGB.IDBANCO)                                '+
                    ' AND (AGP.IDPESSOA(+) = AGB.IDPESSOA)                               '+
                    ' ORDER BY CTB.FLGCONTARESGATE DESC ) WHERE ROWNUM =1                ';

            fcdsAux.Data := GetDataPacket(ssql);
          end;
          //Renato Visoni SOL 138251 kintana 840758

          if fcdsAux.IsEmpty then begin //Renato Visoni SOL 138251 kintana 840758
            //BRUNO AZEVEDO SOL 133891 KINTANA 783366
            //PENSÃO ALIMENTICIA
            ssql:='SELECT AGB.IDBANCO, CTB.CONTACORRENTE, CTB.TIPOCONTA, CTB.flgcontapref, ' +
                  '       CTB.IDCBANCARIA, AGB.NUMAGENCIA, BCO.NUMBANCO,                   ' +
                  '       AGP.NOME AS NOMEAGENCIA                                          ' +
                  'FROM CONTABANCARIA CTB, AGENCIABANCARIA AGB, BANCO BCO, PESSOA AGP,     ' +
                  //'     pessoafisica pess                                                  ' + // Andre Imakawa - SIG 79100
                  '     pessoa pess                                                         ' +  // Andre Imakawa - SIG 79100
                  //'WHERE (CTB.IDPESSOA = '+inttostr(aiidrecebedor)+')                      ' +
                  'WHERE (CTB.IDPESSOA = :B_IDRECEBEDOR)                                     ' +
                  //'AND (CTB.FLGCONTAPREF = 1)                                              ' +
                  'AND (CTB.FLGCONTAPREF = :B1)                                     ' +
                  'AND (AGB.IDPESSOA(+) = CTB.IDAGENCIA)                                   ' +
                  'AND (BCO.IDPESSOA(+) = AGB.IDBANCO)                                     ' +
                  'AND (AGP.IDPESSOA(+) = AGB.IDPESSOA)                                    ' +
                  'AND ctb.idpessoa = pess.idpessoa                                        ' +
                  //'AND NOT EXISTS (SELECT 1 FROM benefbfciario                             ' +
                  'AND NOT EXISTS (SELECT /*+ no_unnest*/ 1 FROM benefbfciario                             ' +
                  '                 WHERE (benefbfciario.idpessoa = pess.idpessoa          ' +
                  '                        OR                                              ' +
                  '                        benefbfciario.idtitular = pess.idpessoa)        ' +
                  //'                   AND benefbfciario.idsitbeneficio IN (1,2,3,9))       ';
                  '                   AND ((benefbfciario.idsitbeneficio = :B2) OR      ' +
                  '                        (benefbfciario.idsitbeneficio = :B3) OR      ' +
                  '                        (benefbfciario.idsitbeneficio = :B4) OR      ' +
                  '                        (benefbfciario.idsitbeneficio = :B5)))     ' ;
            // Andre Imakawa - SIG 115253 - Inicio
            qryaux.Close;
            qryaux.SQl.Clear;
            qryaux.Params.Clear;


            qryaux.Params.CreateParam(ftInteger, 'B_IDRECEBEDOR', ptInput);
            qryaux.Params.CreateParam(ftInteger, 'B1', ptInput);
            qryaux.Params.CreateParam(ftInteger, 'B2', ptInput);
            qryaux.Params.CreateParam(ftInteger, 'B3', ptInput);
            qryaux.Params.CreateParam(ftInteger, 'B4', ptInput);
            qryaux.Params.CreateParam(ftInteger, 'B5', ptInput);


            qryaux.ParamByName('B_IDRECEBEDOR').AsInteger := aiidrecebedor;
            qryaux.ParamByName('B1').AsInteger := 1;
            qryaux.ParamByName('B2').AsInteger := 1;
            qryaux.ParamByName('B3').AsInteger := 2;
            qryaux.ParamByName('B4').AsInteger := 3;
            qryaux.ParamByName('B5').AsInteger := 9;



            qryaux.SQL.add(ssql);
            qryaux.Open;
            // Andre Imakawa - SIG 115253 - Fim



            //fcdsAux.Data := GetDataPacket(ssql);   // Andre Imakawa - SIG 115253
            //CASO NAO ENCONTRE PENSÃO ALIMENTICIA, EXECUTAR A QUERY DE CONTA SALÁRIO
            //if fcdsAux.IsEmpty then begin         // Andre Imakawa - SIG 115253
            if qryaux.IsEmpty then begin            // Andre Imakawa - SIG 115253

              ssql:='SELECT AGB.IDBANCO, CTB.CONTACORRENTE, CTB.TIPOCONTA, '+
                           'CTB.IDCBANCARIA, AGB.NUMAGENCIA, BCO.NUMBANCO, '+
                           'AGP.NOME AS NOMEAGENCIA '+
                    'FROM CONTABANCARIA CTB, AGENCIABANCARIA AGB, BANCO BCO, PESSOA AGP '+
                    'WHERE (CTB.IDPESSOA = '+inttostr(aiidrecebedor)+') '+
                   // SOL:111915 - Daniel Begnami
                   //          'AND (CTB.FLGCONTAPREF = 1) '+
                    'AND (CTB.TIPOCONTA = 2) '+
                    // FIM
                    'AND (AGB.IDPESSOA(+) = CTB.IDAGENCIA) '+
                    'AND (BCO.IDPESSOA(+) = AGB.IDBANCO)'+
                    'AND (AGP.IDPESSOA(+) = AGB.IDPESSOA)';
              fcdsAux.Data:=GetDataPacket(ssql);
            end;//Renato Visoni SOL 138251 kintana 840758
            //BRUNO AZEVEDO SOL 133891 KINTANA 783366
          end;

          //if fcdsAux.isempty then
          if (fcdsAux.isempty) and (qryaux.IsEmpty) then
            if (aicodportparticip < 308) or (aicodportparticip > 310) then // Andre Imakawa - SIG 123059
              exit;

          if fcdsAux.recordcount > 1 then
          begin
            abDuplContaPref:=true;
            exit;
          end;

          if not(qryaux.isempty) then  // Andre Imakawa - SIG 115336
            if (qryaux.recordcount > 1) then
            begin
              abDuplContaPref:=true;
              exit;
            end;

      end;

      if (asnumbanco <> '') and (asnumagencia <> '') and (asnumconta <> '') then
      begin
        // Andre Imakawa - SIG 115253 - Inicio
        if not(fcdsAux.IsEmpty) then
        begin
          if (asnumbanco <> fcdsAux.fieldbyname('NUMBANCO').asstring) or
             (asnumagencia <> fcdsAux.fieldbyname('NUMAGENCIA').asstring) or
             (asnumconta <> fcdsAux.fieldbyname('CONTACORRENTE').asstring) then
            result:=1
          else
            result:=0;
        end
        else
        begin
          if not(qryaux.isempty) then  // Andre Imakawa - SIG 115336
            if (asnumbanco <> qryaux.fieldbyname('NUMBANCO').asstring) or
               (asnumagencia <> qryaux.fieldbyname('NUMAGENCIA').asstring) or
               (asnumconta <> qryaux.fieldbyname('CONTACORRENTE').asstring) then
              result:=1
            else
              result:=0;
        end;
        // Andre Imakawa - SIG 115253 - Fim
      end
      else
        result:=0;

      // Andre Imakawa - SIG 115253 - Inicio
      if not(fcdsAux.IsEmpty) then
      begin
        asnumbanco:=fcdsAux.fieldbyname('NUMBANCO').asstring;
        asnumagencia:=fcdsAux.fieldbyname('NUMAGENCIA').asstring;
        asnumconta:=fcdsAux.fieldbyname('CONTACORRENTE').asstring;
        iidbanco:=fcdsAux.fieldbyname('IDBANCO').asinteger;
        astipoconta:=fcdsAux.fieldbyname('TIPOCONTA').asstring;
        stipocontainterno:=fcdsAux.fieldbyname('TIPOCONTA').asstring;
        asidcbancaria:=fcdsAux.fieldbyname('IDCBANCARIA').asstring;
      end
      else
      begin
        if not(qryaux.isempty) then  // Andre Imakawa - SIG 115336
        begin
          asnumbanco:=qryaux.fieldbyname('NUMBANCO').asstring;
          asnumagencia:=qryaux.fieldbyname('NUMAGENCIA').asstring;
          asnumconta:=qryaux.fieldbyname('CONTACORRENTE').asstring;
          iidbanco:=qryaux.fieldbyname('IDBANCO').asinteger;
          astipoconta:=qryaux.fieldbyname('TIPOCONTA').asstring;
          stipocontainterno:=qryaux.fieldbyname('TIPOCONTA').asstring;
          asidcbancaria:=qryaux.fieldbyname('IDCBANCARIA').asstring;
        end;     
      end;
      // Andre Imakawa - SIG 115253 - Fim
    finally
      FreeAndNil(qryaux);
    end;
  end;

begin
  icodportforma:=0;
  abPagtoElet:=true;
  abDuplContaPref:=false;

  if aitipofolha = 2 then
    llistabcp:=lstExtra
  else
    if aiflgreserva = 1 then
      llistabcp:=lstReserva
    else
      if aiflgprovisorio = 1 then
        llistabcp:=lstProvisorio
      else
        llistabcp:=lstNormal;

  if not assigned(llistabcp) then
    llistabcp:=lstNormal;

  try
    if aicodportparticip <> 0 then
    begin
      if not ExisteCodPortformaLista(llistabcp, aicodportparticip,
               aidfavorecido, //ACHA PORTADOR COM MESMO FAVORECIDO
               true,
               lobjbcp) then
      begin
        if not ExisteCodPortformaLista(llistabcp, aicodportparticip,
                 aidfavorecido, //ACHA PORTADOR COM MESMO FAVORECIDO
                 false, 
                 lobjbcp) then
        begin
          abPagtoElet:=false;
          icodportforma:=aicodportparticip;
          PegaDadosBancarios; // Andre Imakawa - SIG 35803 
          exit;
        end
        else
        begin
          aidfavorecido:=lobjbcp.Favorecido;
          case PegaDadosBancarios of
            -1 : exit;
             0 : begin
                   icodportforma:=aicodportparticip;
                   exit;
                 end;
          end;
        end;
      end
      else
      begin
        aidfavorecido:=lobjbcp.Favorecido;
        case PegaDadosBancarios of
          -1 : exit;
           0 : begin
                 icodportforma:=aicodportparticip;
                 exit;
               end;
        end;
      end;
    end
    else
      if PegaDadosBancarios < 0 then
        exit;

    //Pagamento para Favorecido/Consignatário
    if aiflgfavorecido = 1 then
    begin
      if ExistePortadorFavorecidoLista(llistabcp, lobjbcp) then
      begin
        icodportforma:=lobjbcp.CodPortforma;
        exit;
      end;
    end;

    //ACRESCENTA TIPO OP/Recibo
    if (stipocontainterno = '1') or (stipocontainterno = '4') then
    begin
      if ExistePortadorContaLista(llistabcp,
           iidbanco,
           stipocontainterno, //TESTE TIPO OP/Recibo
           lobjbcp) then
      begin
        icodportforma:=lobjbcp.CodPortforma;
        exit;
      end;
    end;

    if ExistePortadorBancoLista(llistabcp, iidbanco, lobjbcp) then
    begin
      icodportforma:=lobjbcp.CodPortforma;
      exit;
    end;

    if ExistePortadorPadraoLista(llistabcp, lobjbcp) then
    begin
      icodportforma:=lobjbcp.CodPortforma;
      exit;
    end;
  finally
    if not abPagtoElet then
    begin
      if icodportforma = prmPortFormaPatro then
        aidfavorecido:=aiidpatro
      else
        aidfavorecido:=aiidrecebedor;
      aobjPortadorForma:=nil;
      aiseqdoc:=1;
    end
    else
    begin
      if icodportforma <> 0 then
      begin
        aidfavorecido:=lobjbcp.Favorecido;
        aiseqdoc:=DefineSeqDocumento(arValorLiquido, lobjbcp);
        aobjPortadorForma:=lobjbcp;
      end
      //EM CASO DE ERRO NA CONTA BANCARIA
      else
      begin
        aidfavorecido:=0;
        aiseqdoc:=1;
        aobjPortadorForma:=nil;
      end;
    end;
    result:=icodportforma;
  end;
end;

function tCtrlBancoPortForma.DefineSeqDocumento(arValorLiquido: real;
  aobjPortadorForma: tObjPortadorForma): integer;
begin
  result:=1;
  if SistemaFolha.FlgAbreDocAlt then
    if assigned(aobjPortadorForma) then
      if arValorLiquido > 0 then
      begin
        if (arValorLiquido >= aobjPortadorForma.ValorMaximo) and
           (aobjPortadorForma.CodFormaPgtoAlt > 0) then
          result:=2;
      end;
end;

destructor tCtrlBancoPortForma.Destroy;

  procedure DesalocaListas(alista: tstringlist);
  var lii: integer;
  begin
    if assigned(alista) then
    begin
      for lii:=0 to alista.count-1 do
      begin
        (alista.Objects[lii] as tObjPortadorForma).Free;
      end;
      alista.free;
    end;
  end;

begin
  inherited;
  DesalocaListas(lstNormal);
  DesalocaListas(lstExtra);
  DesalocaListas(lstReserva);
  DesalocaListas(lstProvisorio);
end;

function tCtrlBancoPortForma.ExisteCodPortformaLista(
  alista: tstringlist; aicodportforma: integer;
  aidfavorecido: integer; //ACHA PORTADOR COM MESMO FAVORECIDO
  abchecafav: boolean; 
  var aobjbcp: tObjPortadorForma): boolean;
var bcp: tObjPortadorForma;
    lii: integer;
begin
  result:=false;
  if assigned(alista) then
  begin
    for lii:=0 to alista.count-1 do
    begin
      bcp:=(alista.Objects[lii] as tObjPortadorForma);
      if abchecafav then
      begin
        if (bcp.CodPortforma = aicodportforma) and
           (bcp.Favorecido = aidfavorecido) then //ACHA PORTADOR COM MESMO FAVORECIDO
        begin
          aobjbcp:=bcp;
          result:=true;
          exit;
        end;
      end
      else
      begin
        if (bcp.CodPortforma = aicodportforma) then //ACHA PORTADOR COM MESMO FAVORECIDO
        begin
          aobjbcp:=bcp;
          result:=true;
          exit;
        end;
      end;
    end;
  end;
end;

function tCtrlBancoPortForma.ExistePortadorFavorecidoLista(
  alista: tstringlist; var aobjbcp: tObjPortadorForma): boolean;
var bcp: tObjPortadorForma;
    lii: integer;
begin
  result:=false;
  if assigned(alista) then
  begin
    for lii:=0 to alista.count-1 do
    begin
      bcp:=(alista.Objects[lii] as tObjPortadorForma);
      if (bcp.Situacao = '3') then
      begin
        aobjbcp:=bcp;
        result:=true;
        exit;
      end;
    end;
  end;
end;

function tCtrlBancoPortForma.ExistePortadorContaLista(
  alista: tstringlist;
  aiidbanco: integer; //TRATAMENTO DO PORTADOR FORMA PARA TIPO CONTA TEM QUE SER VINCULADO AO BANCO
  astipocontarec: string; //TESTE TIPO OP/Recibo
  var aobjbcp: tObjPortadorForma): boolean;
var bcp: tObjPortadorForma;
    lii: integer;
begin
  result:=false;
  if assigned(alista) then
  begin
    for lii:=0 to alista.count-1 do
    begin
      bcp:=(alista.Objects[lii] as tObjPortadorForma);
      if (bcp.TipoConta = astipocontarec) and
         (bcp.Banco = aiidbanco) then //TESTE TIPO OP/Recibo
      begin
        aobjbcp:=bcp;
        result:=true;
        exit;
      end;
    end;
  end;
end;

function tCtrlBancoPortForma.ExistePortadorBancoLista(alista: tstringlist;
  aibanco: integer; var aobjbcp: tObjPortadorForma): boolean;
var bcp: tObjPortadorForma;
    lii: integer;
begin
  result:=false;
  if assigned(alista) then
  begin
    for lii:=0 to alista.count-1 do
    begin
      bcp:=(alista.Objects[lii] as tObjPortadorForma);
      if (bcp.Banco = aibanco) and
         (bcp.Situacao = 'D') and
         (bcp.TipoConta = 'D') then
      begin
        aobjbcp:=bcp;
        result:=true;
        exit;
      end;
    end;
  end;
end;

function tCtrlBancoPortForma.ExistePortadorPadraoLista(alista: tstringlist;
  var aobjbcp: tObjPortadorForma): boolean;
var bcp: tObjPortadorForma;
    lii: integer;
begin
  result:=false;
  if assigned(alista) then
  begin
    for lii:=0 to alista.count-1 do
    begin
      bcp:=(alista.Objects[lii] as tObjPortadorForma);
      if (bcp.Banco = 0) and
         (bcp.Situacao = 'D') and
         (bcp.TipoConta = 'D') then
      begin
        aobjbcp:=bcp;
        result:=true;
        exit;
      end;
    end;
  end;
end;

function tCtrlBancoPortForma.Inicializa(aidfundacao: integer): boolean;
var ssql: string;
    llista: tstringlist;
begin
  result:=false;
  try
    ssql:='SELECT NVL(BP.IDBANCO,0) AS IDBANCO, BP.TIPOFOLHA, '+_clinefeed+
                 'BP.TIPOCONTA, BP.SITUACAO, BP.CODPORTFORMA, '+_clinefeed+
                 'PF.VALORMAXIMO, PF.CODFORMAPGTOALT, PF.DMAISALT, '+_clinefeed+ 
                 'NVL(BP.IDFAVORECIDO, PC.IDBANCO) AS IDFAVORECIDO '+_clinefeed+
          'FROM BANCOPORTFORMA BP, PORTADORFORMA PF, PORTADORCONTA PC '+_clinefeed+
          'WHERE (BP.IDFUNDACAO = '+inttostr(aidfundacao)+') '+_clinefeed+
          'AND (BP.IDMODULO = 18) '+_clinefeed+
          'AND (PF.CODPORTFORMA = BP.CODPORTFORMA) '+_clinefeed+
          'AND (PF.IDPESSOA = BP.IDFUNDACAO) '+_clinefeed+
          'AND (PF.CODPORTADOR = PC.CODPORTADOR) '+_clinefeed+
          'ORDER BY BP.TIPOFOLHA'+_clinefeed;

    fcdsAux.Data:=GetDataPacket(ssql);
    fcdsAux.first;

    while not fcdsAux.eof do
    begin
      if fcdsAux.fieldbyname('TIPOFOLHA').asstring = 'D' then
        CriaObjBancoPortForma(lstNormal,
          fcdsAux.fieldbyname('TIPOCONTA').asstring,
          fcdsAux.fieldbyname('TIPOFOLHA').asstring,
          fcdsAux.fieldbyname('SITUACAO').asstring,
          fcdsAux.fieldbyname('CODPORTFORMA').asinteger,
          fcdsAux.fieldbyname('IDBANCO').asinteger,
          fcdsAux.fieldbyname('IDFAVORECIDO').asinteger,
          fcdsAux.fieldbyname('VALORMAXIMO').asfloat, 
          fcdsAux.fieldbyname('CODFORMAPGTOALT').asinteger, 
          fcdsAux.fieldbyname('DMAISALT').asinteger); 
      if fcdsAux.fieldbyname('TIPOFOLHA').asstring = '2' then
        CriaObjBancoPortForma(lstExtra,
          fcdsAux.fieldbyname('TIPOCONTA').asstring,
          fcdsAux.fieldbyname('TIPOFOLHA').asstring,
          fcdsAux.fieldbyname('SITUACAO').asstring,
          fcdsAux.fieldbyname('CODPORTFORMA').asinteger,
          fcdsAux.fieldbyname('IDBANCO').asinteger,
          fcdsAux.fieldbyname('IDFAVORECIDO').asinteger,
          fcdsAux.fieldbyname('VALORMAXIMO').asfloat, 
          fcdsAux.fieldbyname('CODFORMAPGTOALT').asinteger, 
          fcdsAux.fieldbyname('DMAISALT').asinteger); 
      if fcdsAux.fieldbyname('TIPOFOLHA').asstring = 'R' then
        CriaObjBancoPortForma(lstReserva,
          fcdsAux.fieldbyname('TIPOCONTA').asstring,
          fcdsAux.fieldbyname('TIPOFOLHA').asstring,
          fcdsAux.fieldbyname('SITUACAO').asstring,
          fcdsAux.fieldbyname('CODPORTFORMA').asinteger,
          fcdsAux.fieldbyname('IDBANCO').asinteger,
          fcdsAux.fieldbyname('IDFAVORECIDO').asinteger,
          fcdsAux.fieldbyname('VALORMAXIMO').asfloat, 
          fcdsAux.fieldbyname('CODFORMAPGTOALT').asinteger, 
          fcdsAux.fieldbyname('DMAISALT').asinteger); 
      if fcdsAux.fieldbyname('TIPOFOLHA').asstring = 'V' then
        CriaObjBancoPortForma(lstProvisorio,
          fcdsAux.fieldbyname('TIPOCONTA').asstring,
          fcdsAux.fieldbyname('TIPOFOLHA').asstring,
          fcdsAux.fieldbyname('SITUACAO').asstring,
          fcdsAux.fieldbyname('CODPORTFORMA').asinteger,
          fcdsAux.fieldbyname('IDBANCO').asinteger,
          fcdsAux.fieldbyname('IDFAVORECIDO').asinteger,
          fcdsAux.fieldbyname('VALORMAXIMO').asfloat, 
          fcdsAux.fieldbyname('CODFORMAPGTOALT').asinteger, 
          fcdsAux.fieldbyname('DMAISALT').asinteger); 
      fcdsAux.next;
    end;
    result:=true;
  except
    result:=false;
  end;
end;

procedure tCtrlBancoPortForma.SetcdsAux(const Value: TCMClientDataSet);
begin
  FcdsAux := Value;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: UCTRLBANCOPORTFORMA                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TRATA EM 3 CAMADAS O PROCESSAMENTO DA TABELA BANCOPORTFORMA NA PREVIA      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26.07.2004 A 26.07.2004                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CRIAÇÃO DA UNIT PARA TRATAR PENDENCIA 15948                                  |
|                                                                              |
|------------------------------------------------------------------------------}


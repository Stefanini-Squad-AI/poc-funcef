// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 205361 - KTN 1986514
//Responsável : Fernando Xavier
//Data        : 19/04/2013
//Descrição   : Permitir mais de um Benefício INSS correção do SOL 181948
//------------------------------------------------------------------------------
//Pendência   : SOL 205075 - KTN 1983581
//Responsável : Fernando Xavier
//Data        : 16/04/2013
//Descrição   : Permitir mais de um Benefício INSS correção do SOL 181948
//------------------------------------------------------------------------------
// Pendência : SOL 181948 - KINTANA 1724239
// Autor(a)  : TADEU PASSOS
// Data      : 24/01/2013
// Descrição : Alteração para permitir mais de um benefício
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 26/01/2004
// Pendência : 15925
// Descrição : Inclusão do campo MATRÍCULA para gravação da matrícula do
//             Beneficiário / Pensionista
// -----------------------------------------------------------------------------
// Autor(a)  : Camille
// Data      : 03.12.2003
// Descrição : Tratamento de Dependentes Cancelados
// -----------------------------------------------------------------------------
unit fSelecionaBeneficiariosdoBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, DBGrids,
  checklst, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelecionaBeneficiariosdoBeneficio = class(TfrmOkCancelar)
    qryBeneficiario: TwwQuery;
    wwDtsBeneficiarios: TwwDataSource;
    qryBeneficiarioNOME: TStringField;
    qryBeneficiarioDESCRICAO: TStringField;
    qryBeneficiarioNUMSEQUENCIA: TFloatField;
    qryBeneficiarioIDDEPENDENCIA: TStringField;
    qryBeneficiarioFLGCONTAIMPOSTOR: TFloatField;
    qryBeneficiarioFLGCONTASALARIOF: TFloatField;
    qryBeneficiarioFLGBENEFICIARIO: TFloatField;
    qryBeneficiarioIDTITULAR: TFloatField;
    qryBeneficiarioIDPESSJUR: TFloatField;
    qryBeneficiarioIDPLANOPREV: TFloatField;
    qryBeneficiarioIDPESSOA: TFloatField;
    qryBeneficiarioIDRESPONSAVEL: TFloatField;
    qryBeneficiarioIDBENEFICIO: TFloatField;
    qryBeneficiarioPRIORIDADE: TFloatField;
    qryBeneficiarioPERCENTUAL: TFloatField;
    clbBeneficiarios: TCheckListBox;
    qryAux: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    clbNaoAprovados: TCheckListBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    function VerificaBeneficiario(NomeBeneficiario : String) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaBeneficiariosdoBeneficio: TfrmSelecionaBeneficiariosdoBeneficio;
  bAlgumElegivel,
  bSaiuSel : boolean;  

implementation

{$R *.DFM}

uses fCadRequerBenefBfciario, UMensErro, UBeneficio,
  FCadRequerBenefParticip;

procedure TfrmSelecionaBeneficiariosdoBeneficio.bbtnConfirmarClick(
  Sender: TObject);
var i: integer;
    balgum,
    bPrimeiro : boolean;
    sSQLNomes : string;
begin
   inherited;

   bAlgum := false;
   for i := 0 to clbbeneficiarios.items.count-1 do
   begin
      if clbbeneficiarios.checked[i] then
      begin
         balgum := true;
         break;
      end;
   end;

   // TADEU PASSOS, SOL 181948 KINTANA 1724239
   for i := 0 to clbBeneficiarios.Items.Count-1 do
     begin
       if (clbBeneficiarios.Checked[i]) and (not VerificaBeneficiario(ClbBeneficiarios.Items.Strings[i])) then
         begin
           bSaiusel := True;
           Exit;
         end;
     end;
   // TADEU PASSOS, SOL 181948 KINTANA 1724239


   with frmCadRequerBenefBfciario do
   begin
      qryBeneficiario.Close;
      qryBeneficiario.SQL.Clear;
      qryBeneficiario.SQL.Add('SELECT P.IDPESSOA, P.NOME, D.DESCRICAO,DT.NUMSEQUENCIA, DT.IDDEPENDENCIA,DT.FLGCONTAIMPOSTOR,');
      qryBeneficiario.SQL.Add('DT.FLGCONTASALARIOF,DT.FLGBENEFICIARIO,BT.IDTITULAR, BT.IDPESSJUR,BT.IDPLANOPREV, BT.IDPESSOA,');
      qryBeneficiario.SQL.Add('BT.IDRESPONSAVEL, BT.IDBENEFICIO, BT.PRIORIDADE, BT.PERCENTUAL, PRESP.NOME AS NOMERESPONSAVEL,');
      qryBeneficiario.SQL.Add('PF.DATANASC, PF.SEXO, DT.MATRICULA  ');
      qryBeneficiario.SQL.Add('FROM   PESSOA P, PESSOA PRESP, DEPEN D, DEPENTIT DT, BFCIARIOTITPLAN BT, PESSOAFISICA PF');
      qryBeneficiario.SQL.Add('WHERE  (BT.IDTITULAR    = :IDTITULAR)');
      qryBeneficiario.SQL.Add('AND    (BT.IDPESSJUR    = :IDPESSJUR)');
      qryBeneficiario.SQL.Add('AND    (BT.IDPLANOPREV  = :IDPLANOPREV)');
      qryBeneficiario.SQL.Add('AND    (BT.IDBENEFICIO  = :IDBENEFICIO)');
      qryBeneficiario.SQL.Add('AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+)) ');
      qryBeneficiario.SQL.Add('AND    (DT.IDPESSOA     = BT.IDPESSOA)');
      qryBeneficiario.SQL.Add('AND    (DT.IDTITULAR    = BT.IDTITULAR)');
      qryBeneficiario.SQL.Add('AND    (D.IDDEPENDENCIA = DT.IDDEPENDENCIA)');
      qryBeneficiario.SQL.Add('AND    (P.IDPESSOA      = BT.IDPESSOA) ');
      qryBeneficiario.SQL.Add('AND    (PF.IDPESSOA      = P.IDPESSOA) ');
      qryBeneficiario.SQL.Add('AND    (DT.DATACANCELA  IS NULL ) ');

      if (ClbBeneficiarios.Items.Count > 0) and (bAlgum)
      then begin
         bPrimeiro := True;
         sSQLNomes := '';
         for i := 0 to clbBeneficiarios.Items.Count-1 do
         begin
            // adicionando linhas selecionadas
            if clbBeneficiarios.Checked[I]
            then begin
               if bPrimeiro
               then begin
                  sSQLNomes := ' AND (  (P.NOME LIKE '+''''+ClbBeneficiarios.Items.Strings[i]+''''+')';
                  bPrimeiro := False;
               end
               else sSQLNomes := sSQLNomes+ ' OR (P.NOME LIKE '+''''+ClbBeneficiarios.Items.Strings[i]+''''+')';
            end;
         end;
         sSQLNomes := sSQLNomes + ') ';
      end;
      if Trim(sSQLNomes) <> ''
      then frmCadRequerBenefBfciario.qryBeneficiario.SQL.Add(sSQLNomes);
   end;
   frmCadRequerBenefBfciario.qryBeneficiario.SQL.Add('ORDER BY P.NOME');

   if (ClbBeneficiarios.Items.Count > 0)
   then bAlgumElegivel := True
   else bAlgumElegivel := False;

   if bAlgum
   then bSaiuSel := False
   else bSaiusel := True;
   Close;
end;

procedure TfrmSelecionaBeneficiariosdoBeneficio.FormCreate(
  Sender: TObject);
var bElegivel, bErro : boolean;
    sMsgErro         : string;
begin
  inherited;
  qryBeneficiario.Close;
  qryBeneficiario.ParamByName('IdTitular').AsInteger   := iIdTitularSel;
  qryBeneficiario.ParamByName('IdPessJur').AsInteger   := iIdPessjurSel;
  qryBeneficiario.ParamByName('IdPlanoPrev').AsInteger := iIdPlanoPrevSel;
  qryBeneficiario.ParamByName('IdBeneficio').AsInteger := frmCadRequerBenefBfciario.qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryBeneficiario.Open;
  qryBeneficiario.First;
  while not qrybeneficiario.EOF do
  begin
     // rodar regra de elegibilidade de cada beneficiario
      bElegivel := ExecutaRegraElegibilidadeBfciario(qryAux,
                                frmCadRequerBenefBfciario.qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger,
                                iIdPessJurSel, iIdPlanoPrevSel, iIdTitularSel,
                                qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                1,
                                frmCadRequerBenefBfciario.qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                frmCadRequerBenefBfciario.rOpcao1,
                                frmCadRequerBenefBfciario.rOpcao2,
                                frmCadRequerBenefBfciario.rOpcao3,
                                frmCadRequerBenefBfciario.dtDataEvento.Text,
                                frmCadRequerBenefBfciario.dtInicioFund.Text,
                                frmCadRequerBenefBfciario.sDataDemissao,
                                bErro,
                                sMsgErro,
                                1);

     if bElegivel
     then begin
        clbBeneficiarios.Items.Add(qryBeneficiario.FieldByName('Nome').AsString);
        clbBeneficiarios.Checked[clbBeneficiarios.Items.Count - 1] := True;
     end
     else begin
        clbNaoAprovados.Items.Add(qryBeneficiario.FieldByName('Nome').AsString);
        clbNaoAprovados.Checked[clbNaoAprovados.Items.Count - 1] := False;
     end;
     qrybeneficiario.Next;
  end;
end;

procedure TfrmSelecionaBeneficiariosdoBeneficio.bbtnCancelarClick(
  Sender: TObject);
  var i : Integer;
begin
  inherited;
  for i := 0 to ClbBeneficiarios.Items.Count-1 do
      clbBeneficiarios.Checked[I] := False;
  bSaiuSel       := False;
  bAlgumElegivel := True;
 
end;

procedure TfrmSelecionaBeneficiariosdoBeneficio.bbtnSairClick(
  Sender: TObject);
begin

  if MsgDlg('Deseja sair da seleção de beneficiários?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrno
  then Exit;

  bSaiusel       := True;
  bAlgumElegivel := True;

  inherited;
end;

// TADEU PASSOS, SOL 181948 KINTANA 1724239
function TfrmSelecionaBeneficiariosdoBeneficio.VerificaBeneficiario(NomeBeneficiario : String) : Boolean;
begin
  Result := True;
  // SOL 205361 - KTN 1986514
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select nvl(FlgReferencia,0) AS FlgReferencia from BENEFPLANPREV ');
  qryAux.SQL.Add(' where idplanoprev = '+ qryBeneficiarioIDPLANOPREV.AsString);
  qryAux.SQL.Add(' and   idbeneficio = '+ qryBeneficiarioIDBENEFICIO.AsString);
  qryAux.Open;
  // SOL 205361 - KTN 1986514
  if (qryAux.FieldByName('FlgReferencia').asInteger = 0 ) then // Caso seja beneficio funcef sai do metodo e não faz a validação
     exit;

  qryBeneficiarioidBeneficio.asString;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF, BENEFICIO B, PESSOA P  ' +
                 ' WHERE BF.IDBENEFICIO = B.IDBENEFICIO ' +
                 ' AND BF.IDPESSOA = P.IDPESSOA ' +
                 ' AND P.NOME LIKE ' + QuotedStr(NomeBeneficiario) +
                 ' AND BF.IDTITULAR      = ' + qryBeneficiarioIDTITULAR.AsString +
              // ' AND BF.SEQPROPOSTA    = ' + IntToStr(iSeqProposta) +
                 ' AND BF.IDPESSJUR      = ' + qryBeneficiarioIDPESSJUR.AsString +
                 ' AND BF.IDPLANOORIGEM  = ' + qryBeneficiarioIDPLANOPREV.AsString +
                 ' AND B.IDEVENTOGERADOR = 130' +
                 ' AND BF.FONTEPAGADORA = 2 '+  //  SOL 205075 - KTN 1983581
                 ' AND BF.IDSITBENEFICIO <> 3'); // Encerrado
  qryAux.Open;

  if not qryAux.IsEmpty then
  begin
    MsgDlg('Existe um benefício em aberto para esta pessoa em outro processo. Para requerer um novo beneficio é necessário ' + #13 +
           'que o benefício existente seja encerrado.','Atenção!',mtConfirmation,[mbOk,mbHelp],0);
    qryAux.Close;
    Result := False;
    Exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT B.IDBENEFICIO FROM BENEFBFCIARIO BF, BENEFICIO B, PESSOA P ' +
                 'WHERE BF.IDBENEFICIO = B.IDBENEFICIO ' +
                 ' AND BF.IDPESSOA = P.IDPESSOA ' +
                 ' AND P.NOME LIKE ' + QuotedStr(NomeBeneficiario) +
                 ' AND BF.IDPESSJUR = ' + qryBeneficiarioIDPESSJUR.AsString +
                 ' AND BF.IDTITULAR = ' + qryBeneficiarioIDTITULAR.AsString +
                 ' AND BF.IDPLANOORIGEM = ' + qryBeneficiarioIDPLANOPREV.AsString +
            //   ' AND BF.SEQPROPOSTA =  1 '
                 ' AND B.IDEVENTOGERADOR = 130' +
                 ' AND BF.IDSITBENEFICIO = 3');

  qryAux.Open;

  if not qryAux.IsEmpty then
  begin
    if MsgDlg('Este benefício já foi requerido para essa pessoa em outro processo. Deseja requerer um novo beneficio?',
              'Atenção!',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      begin
        qryAux.Close;
        Result := False;
        Exit;
      end;
  end;
end;
// TADEU PASSOS, SOL 181948 KINTANA 1724239

end.

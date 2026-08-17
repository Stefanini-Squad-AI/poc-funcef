// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Augsto
// Data      : 27/04/2004
// Descrição : Troca de PlanoPrev para PlanoOrigem na Pesquisa
// -----------------------------------------------------------------------------
// Autor(a)  : Camille
// Data      : 03.12.2003
// Descrição : Tratamento de Dependentes Cancelados
// -----------------------------------------------------------------------------
unit FSelecionaBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, DBGrids,
  checklst, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelecionaBeneficiarios = class(TfrmOkCancelar)
    qryBeneficiario: TwwQuery;
    dsBeneficiarios: TwwDataSource;
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
    qryAux: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    clbNaoAprovados: TCheckListBox;
    qryBenefAprovados: TwwQuery;
    updAprovados: TUpdateSQL;
    dbgrdBenefAprovados: TwwDBGrid;
    dsBenefAprovados: TwwDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    bAlgumElegivel,
    bSaiuSel : boolean;
  public
    { Public declarations }
    function SelecionaBeneficiarios(
                                 piIdPessJur,    piIdPlanoPrev, piIdTitular,
                                 piSeqProposta,  piIdBeneficio, piIdRegraBeneficiario : longint;
                                 psDataDemissao, psDataEvento,  psDataInicioFund,
                                 psOpcao1,       psOpcao2,      psOpcao3              : string;
                                 piIdTipoINSS                                         : word;
                                 var qryRetorno                                       : TwwQuery;
                                 piNumeroProcesso                                     : longint ) : boolean;
                                 
  end;

var
  frmSelecionaBeneficiarios: TfrmSelecionaBeneficiarios;

implementation

{$R *.DFM}

uses UMensErro, UBeneficio, UAdmPrev;

function TfrmSelecionaBeneficiarios.SelecionaBeneficiarios(
                                 piIdPessJur,    piIdPlanoPrev, piIdTitular,
                                 piSeqProposta,  piIdBeneficio, piIdRegraBeneficiario : longint;
                                 psDataDemissao, psDataEvento,  psDataInicioFund,
                                 psOpcao1,       psOpcao2,      psOpcao3              : string;
                                 piIdTipoINSS                                         : word;
                                 var qryRetorno                                       : TwwQuery;
                                 piNumeroProcesso                                     : longint ) : boolean;
var bErro, bElegivel : boolean;
    sMsgErro,
    sIdsSelecionados : string;
begin
   Result := False;

   qryBeneficiario.Close;
   qryBeneficiario.ParamByName('IdTitular').AsInteger   := piIdTitular;
   qryBeneficiario.ParamByName('IdPessJur').AsInteger   := piIdPessJur;
   qryBeneficiario.ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
   qryBeneficiario.ParamByName('IdBeneficio').AsInteger := piIdBeneficio;
   qryBeneficiario.Open;
   qryBeneficiario.First;
   while not qryBeneficiario.EOF do
   begin
      if piNumeroProcesso > 0
      then begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDPESSOA FROM BENEFBFCIARIO '+
                    ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                    ' AND    IDTITULAR      = '+IntToStr(piIdTitular)+
                    ' AND    IDPESSOA       = '+qryBeneficiario.FieldByName('IdPessoa').AsString+
                    ' AND    IDBENEFICIO    = '+IntToStr(piIdBeneficio));
            Open;
            if not IsEmpty
            then begin
               qryBeneficiario.Next;
               Continue;
            end;
         end;
      end;
      // rodar regra de elegibilidade de cada beneficiario
      bElegivel := ExecutaRegraElegibilidadeBfciario( qryAux,
                                                      piIdRegraBeneficiario,
                                                      piIdPessJur,
                                                      piIdPlanoPrev,
                                                      piIdTitular,
                                                      qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                      1,
                                                      piIdBeneficio,
                                                      StrToFloat(ClienteNumero(psOpcao1)),
                                                      StrToFloat(ClienteNumero(psOpcao2)),
                                                      StrToFloat(ClienteNumero(psOpcao3)),
                                                      psDataEvento,
                                                      psDataInicioFund,
                                                      psDataDemissao,
                                                      bErro,
                                                      sMsgErro,
                                                      piIdTipoINSS );

     if bElegivel
     then begin
        qryBenefAprovados.Insert;
        qryBenefAprovados.FieldByName('FLGCONCEDE').AsInteger := 1;
        qryBenefAprovados.FieldByName('IDPESSOA').AsInteger   := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
        qryBenefAprovados.FieldByName('NOME').AsString        := qryBeneficiario.FieldByName('NOME').AsString;
        qryBenefAprovados.Post;
     end
     else begin
        clbNaoAprovados.Items.Add(qryBeneficiario.FieldByName('Nome').AsString);
        clbNaoAprovados.Checked[clbNaoAprovados.Items.Count - 1] := False;
     end;
      qryBeneficiario.Next;
   end;

   ShowModal;

   Result := False;
   if ModalResult = mrOK
   then begin
      sIdsSelecionados := '';
      qryBenefAprovados.First;
      while not qryBenefAprovados.Eof do
      begin
         if qryBenefAprovados.FieldByName('FLGCONCEDE').AsInteger = 0
         then begin
            qryBenefAprovados.Next;
            continue;
         end;

         if Trim(sIdsSelecionados) = ''
         then sIdsSelecionados := qryBenefAprovados.FieldByName('IDPESSOA').AsString
         else sIdsSelecionados := sIdsSelecionados+','+qryBenefAprovados.FieldByName('IDPESSOA').AsString;
         qryBenefAprovados.Next;
      end; // while

      if Trim(sIdsSelecionados) = '' then Exit;
      // Ahrir query de retorno
      with qryRetorno do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT P.IDPESSOA,          P.NOME,              D.DESCRICAO,           ');
         SQL.Add('       DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,    DT.FLGCONTAIMPOSTOR,   ');
         SQL.Add('       DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO,  BT.IDTITULAR,          ');
         SQL.Add('       BT.IDPESSJUR,        BT.IDPLANOPREV,      BT.IDPESSOA,           ');
         SQL.Add('       BT.IDDEPENRESPON,                                                ');                                            
         SQL.Add('       BT.IDRESPONSAVEL,    BT.IDBENEFICIO,      BT.PRIORIDADE,         ');
         SQL.Add('       BT.PERCENTUAL,       PF.DATANASC,         PF.SEXO,               ');
         SQL.Add('       PRESP.NOME AS NOMERESPONSAVEL, DT.MATRICULA                      ');
         SQL.Add('FROM   PESSOA P, PESSOA PRESP, DEPEN D, DEPENTIT DT, BFCIARIOTITPLAN BT,');
         SQL.Add('       PESSOAFISICA PF                                                  ');
         SQL.Add('WHERE  (BT.IDTITULAR     = '+IntToStr(piIdTitular)+')                   ');
         SQL.Add('AND    (BT.IDPESSJUR     = '+IntToStr(piIdPessJur)+')                   ');
         SQL.Add('AND    (BT.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+')                 ');
         SQL.Add('AND    (BT.IDBENEFICIO   = '+IntToStr(piIdBeneficio)+')                 ');
         SQL.Add('AND    (BT.IDPESSOA      IN ('+sIdsSelecionados+'))'                     );
         SQL.Add('AND    (BT.IDRESPONSAVEL = PRESP.IDPESSOA(+))                           ');
         SQL.Add('AND    (DT.IDPESSOA      = BT.IDPESSOA)                                 ');
         SQL.Add('AND    (DT.IDTITULAR     = BT.IDTITULAR)                                ');
         SQL.Add('AND    (D.IDDEPENDENCIA  = DT.IDDEPENDENCIA)                            ');
         SQL.Add('AND    (P.IDPESSOA       = BT.IDPESSOA)                                 ');
         SQL.Add('AND    (PF.IDPESSOA      = P.IDPESSOA)                                  ');
         Open;

         Result := True;
      end;
   end; // else
end;

procedure TfrmSelecionaBeneficiarios.FormCreate(
  Sender: TObject);
var bElegivel, bErro : boolean;
    sMsgErro         : string;
begin
  inherited;
  qryBeneficiario.Close;
  qryBeneficiario.ParamByName('IdTitular').AsInteger   := -1;
  qryBeneficiario.ParamByName('IdPessJur').AsInteger   := -1;
  qryBeneficiario.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryBeneficiario.ParamByName('IdBeneficio').AsInteger := -1;
  qryBeneficiario.Open;

  qryBenefAprovados.Close;
  qryBenefAprovados.Open;

  clbNaoAprovados.Items.Clear;
end;

procedure TfrmSelecionaBeneficiarios.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
end;

procedure TfrmSelecionaBeneficiarios.bbtnCancelarClick(
  Sender: TObject);
  var i : Integer;
begin
  inherited;
end;

procedure TfrmSelecionaBeneficiarios.bbtnSairClick(
  Sender: TObject);
begin
  inherited;
end;

procedure TfrmSelecionaBeneficiarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; // nao deixar dar Free
end;



end.
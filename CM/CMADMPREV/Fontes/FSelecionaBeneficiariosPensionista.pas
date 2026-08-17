// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG....: WO17744
// Rotina    : QryBeneficiarioEleg
// Autor(a)  : Leandro Pocebon
// Data      : 14/04/2025
// Descrição : Tratamento para trazer  benefícios vinculados a
//             matrícula de pensionista 
// -----------------------------------------------------------------------------
// Rotina    : QryBeneficiarioEleg
// Autor(a)  : Augusto
// Data      : 26/07/2004
// Descrição : Trazer percentual de beneficio do beenficiario 
// Data      : 11/02/2004
// Descrição : Incluir tbm na lista de Beneficiarios o Proprio, para o caso de Espólio
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 27/01/2004
// Pendência : 15925
// Descrição : Inclusão do campo MATRÍCULA para gravação da matrícula do
//             Beneficiário / Pensionista
// -----------------------------------------------------------------------------
unit FSelecionaBeneficiariosPensionista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, DBGrids,
  checklst, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelecionaBeneficiariosPensionista = class(TfrmOkCancelar)
    qryBeneficiarioEleg: TwwQuery;
    wwDtsBeneficiarios: TwwDataSource;
    qryBeneficiarioElegNOME: TStringField;
    qryBeneficiarioElegDESCRICAO: TStringField;
    qryBeneficiarioElegNUMSEQUENCIA: TFloatField;
    qryBeneficiarioElegIDDEPENDENCIA: TStringField;
    qryBeneficiarioElegFLGCONTAIMPOSTOR: TFloatField;
    qryBeneficiarioElegFLGCONTASALARIOF: TFloatField;
    qryBeneficiarioElegFLGBENEFICIARIO: TFloatField;
    qryBeneficiarioElegIDTITULAR: TFloatField;
    qryBeneficiarioElegIDPESSJUR: TFloatField;
    qryBeneficiarioElegIDPLANOPREV: TFloatField;
    qryBeneficiarioElegIDPESSOA: TFloatField;
    qryBeneficiarioElegIDRESPONSAVEL: TFloatField;
    qryBeneficiarioElegIDBENEFICIO: TFloatField;
    qryBeneficiarioElegPRIORIDADE: TFloatField;
    qryBeneficiarioElegPERCENTUAL: TFloatField;
    clbBeneficiarios: TCheckListBox;
    qryAux: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    clbNaoAprovados: TCheckListBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaBeneficiariosPensionista: TfrmSelecionaBeneficiariosPensionista;
  bAlgumElegivel,
  bSaiuSel : boolean;  

implementation

{$R *.DFM}

uses FCadRequerBenefPensionista, UMensErro, UBeneficio;

procedure TfrmSelecionaBeneficiariosPensionista.bbtnConfirmarClick(
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

   with frmCadRequerBenefPensionista do
   begin
      qryBeneficiario.Close;
      qryBeneficiario.SQL.Clear;
      qryBeneficiario.SQL.Add(' SELECT P.NOME,              D.DESCRICAO,        P.IDPESSOA,               '+
                              '        P.NOME AS NOMERESPONSAVEL,                                         '+
                              '        DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,   DT.FLGCONTAIMPOSTOR,      '+
                              '        DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO, DT.IDTITULAR,             '+
                              '        DT.IDPESSOA,         PP.IDPESSJUR,       PP.IDPLANOPREV,           '+
                              '        -1 AS IDRESPONSAVEL, -1 AS IDBENEFICIO,  0 AS PRIORIDADE,          '+
                              '        BT.PERCENTUAL,                                                   '+
                              '        PF.DATANASC, PF.SEXO, DT.MATRICULA                                 '+  
                              ' FROM   PESSOA P, DEPEN D, DEPENTIT DT,  PESSOAFISICA PF, PARTPREVPLAN PP, '+
                              '        BFCIARIOTITPLAN BT '+
                              ' WHERE  PP.IDPESSOA      = :IDTITULAR                                      '+
                              ' AND    DT.IDTITULAR = :IDTITULAR                                          '+ //WO17744 Leandro
                              ' AND    PP.FLGDESATIVADO = 0                                               '+
                              ' AND    ((DT.IDTITULAR  = :IDPENSIONISTA) or (DT.IDPESSOA = :IDPENSIONISTA) ) '+
                              ' AND    P.IDPESSOA      = DT.IDPESSOA                                     '+
                              ' AND    PF.IDPESSOA     = DT.IDPESSOA                                     '+
                              ' AND    D.IDDEPENDENCIA = DT.IDDEPENDENCIA                                '+
                              ' AND    DT.IDTITULAR    = BT.IDTITULAR(+)                                 '+
                              ' AND    DT.IDPESSOA     = BT.IDPESSOA(+)                                  '+
                              ' AND    BT.IDBENEFICIO(+) = :IDBENEFICIO                                    ');

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
      then frmCadRequerBenefPensionista.qryBeneficiario.SQL.Add(sSQLNomes);
   end;
   frmCadRequerBenefPensionista.qryBeneficiario.SQL.Add('ORDER BY P.NOME');

   if (ClbBeneficiarios.Items.Count > 0)
   then bAlgumElegivel := True
   else bAlgumElegivel := False;

   if bAlgum
   then bSaiuSel := False
   else bSaiusel := True;
   Close;
end;

procedure TfrmSelecionaBeneficiariosPensionista.FormCreate(
  Sender: TObject);
var bElegivel, bErro : boolean;
    sMsgErro         : string;
begin
  inherited;
  qryBeneficiarioEleg.Close;
  qryBeneficiarioEleg.ParamByName('IdTitular').AsInteger      := frmCadRequerBenefPensionista.iIdTitular;
  qryBeneficiarioEleg.ParamByName('IdPensionista').AsInteger  := frmCadRequerBenefPensionista.iIdPensionista;
  qryBeneficiarioEleg.Open;
  qryBeneficiarioEleg.First;
  while not qryBeneficiarioEleg.EOF do
  begin
     // rodar regra de elegibilidade de cada beneficiario
      bElegivel := ExecutaRegraElegibilidadeBfciario(qryAux,
                                frmCadRequerBenefPensionista.qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger,
                                iIdPessJurSel, iIdPlanoPrevSel, iIdTitularSel,
                                qryBeneficiarioEleg.FieldByName('IdPessoa').AsInteger,
                                1,
                                frmCadRequerBenefPensionista.qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                frmCadRequerBenefPensionista.rOpcao1,
                                frmCadRequerBenefPensionista.rOpcao2,
                                frmCadRequerBenefPensionista.rOpcao3,
                                frmCadRequerBenefPensionista.dtMortePensionista.Text,
                                frmCadRequerBenefPensionista.dtInicioFund.Text,
                                frmCadRequerBenefPensionista.sDataDemissao,
                                bErro,
                                sMsgErro,
                                1);

     if bElegivel
     then begin
        clbBeneficiarios.Items.Add(qryBeneficiarioEleg.FieldByName('Nome').AsString);
        clbBeneficiarios.Checked[clbBeneficiarios.Items.Count - 1] := True;
     end
     else begin
        clbNaoAprovados.Items.Add(qryBeneficiarioEleg.FieldByName('Nome').AsString);
        clbNaoAprovados.Checked[clbNaoAprovados.Items.Count - 1] := False;
     end;
     qryBeneficiarioEleg.Next;
  end;
end;

procedure TfrmSelecionaBeneficiariosPensionista.bbtnCancelarClick(
  Sender: TObject);
  var i : Integer;
begin
  inherited;
  for i := 0 to ClbBeneficiarios.Items.Count-1 do
      clbBeneficiarios.Checked[I] := False;
  bSaiuSel       := False;
  bAlgumElegivel := True;
 
end;

procedure TfrmSelecionaBeneficiariosPensionista.bbtnSairClick(
  Sender: TObject);
begin

  if MsgDlg('Deseja sair da seleção de beneficiários?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrno
  then Exit;

  bSaiusel       := True;
  bAlgumElegivel := True;

  inherited;
end;

end.

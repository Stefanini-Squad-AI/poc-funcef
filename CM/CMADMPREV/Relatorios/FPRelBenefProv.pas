unit FPRelBenefProv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Mask, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmPRelBenefProv = class(TfrmOkCancelar)
    grpParamBenef: TGroupBox;
    mebMeses: TMaskEdit;
    ckbIncluiMes: TCheckBox;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelBenefProv: TfrmPRelBenefProv;

implementation

uses UMensErro, DRelatAdmPrev, UAdmPrev;

{$R *.DFM}

procedure TfrmPRelBenefProv.bbtnConfirmarClick(Sender: TObject);
var sOper, sEnd, sSQL : string;
begin
   if (trim(mebMeses.Text) = '') or (strtoint(trim(mebMeses.Text)) = 0) then
     begin
       MsgDlg('Informe o mês final do prazo!','Informação',mtInformation,[mbOk,mbHelp],0);
       mebMeses.SetFocus;
       exit;
     end;

   with dtmRelatAdmPrev do
   begin
     { OBTER DADOS DA FUNDAÇÃO }
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     {  MONTAR DADOS DE BENEFÍCIOS PROVISÓRIOS  }
     if ckbIncluiMes.Checked then sOper := '>='
     else sOper := '=';

     sSQL := 'SELECT P.NOME, PAT.NOME AS PATRO, PL.NOME AS PLANO, B.NOME AS BENEFICIO, ' +
             'PP.INSCRICAONUMERO, EP.MATRICULA, TO_CHAR(BFP.DATAFINAL,''MM/YYYY''), ' +
             'BFP.DATAINICIO, BFP.PRAZOPROVISORIO, BFP.VALORATUAL ' +
             'FROM PESSOA P, PESSOA PAT, PLANPREV PL, BENEFICIO B, ' +
             'PARTPREVPLAN PP, ELEGPATRO EP, ' +
             '(SELECT IDPLANOPREV, IDPESSOA, IDPESSJUR, DATAFINAL, IDBENEFICIO, NUMEROPROCESSO, ' +
             'DATAINICIO, PRAZOPROVISORIO, VALORATUAL ' +
             'FROM BENEFBFCIARIO ' +
             'WHERE (FLGPROVISORIO = 1) ' +
             'AND   (DATAFINAL IS NOT NULL) ' +
             'GROUP BY IDPLANOPREV, IDPESSOA, IDPESSJUR, DATAFINAL, IDBENEFICIO, NUMEROPROCESSO, ' +
             'DATAINICIO, PRAZOPROVISORIO, VALORATUAL ' +
             'HAVING (ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,''MM/YYYY''), ''MM/YYYY''),:piMes) ' + sOper +
             ' TO_DATE(TO_CHAR(DATAFINAL,''MM/YYYY''),''MM/YYYY'') ' +
             'AND DATAFINAL >= SYSDATE) ) BFP ' +
             'WHERE (P.IDPESSOA = BFP.IDPESSOA) ' +
             'AND   (PAT.IDPESSOA = BFP.IDPESSJUR) ' +
             'AND   (PL.IDPLANOPREV = BFP.IDPLANOPREV) ' +
             'AND   (PP.IDPLANOPREV = BFP.IDPLANOPREV) ' +
             'AND   (PP.IDPESSOA  = BFP.IDPESSOA) ' +
             'AND   (EP.IDPESSJUR = BFP.IDPESSJUR) ' +
             'AND   (EP.IDPESSOA  = BFP.IDPESSOA) ' +
             'AND   (B.IDBENEFICIO = BFP.IDBENEFICIO) ' +
             'ORDER BY BFP.DATAFINAL, BFP.DATAINICIO, P.NOME';

     qryBenefProv.Close;
     qryBenefProv.SQL.Clear;
     qryBenefProv.SQL.Add(sSQL);
     qryBenefProv.ParamByName('piMes').asinteger;
     qryBenefProv.ParamByName('piMes').asinteger := strtoint(trim(mebMeses.text));
     qryBenefProv.Prepare;
     qryBenefProv.Open;
   end;
   inherited;

end;

end.

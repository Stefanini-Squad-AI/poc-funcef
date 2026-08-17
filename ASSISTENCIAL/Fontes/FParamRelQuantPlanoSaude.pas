unit FParamRelQuantPlanoSaude;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, Mask, wwdbedit, Wwdbspin,
  wwdblook, CMDBLookupCombo, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmQuantBenefPlanoSaude = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    CbMes: TComboBox;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Fazqry;
  public
    { Public declarations }
  end;

var
  frmQuantBenefPlanoSaude: TfrmQuantBenefPlanoSaude;
   wDia,wMes,wAno : Word;

implementation

uses dRelAssistencial, uMensErro;

{$R *.DFM}
procedure TfrmQuantBenefPlanoSaude.Fazqry;
Var
  wMes,
  sSQL : String;
begin
     DtmRelAssistencial.rpQuantPlanoSaudeLabel16.Caption := cbmes.Text+'/'+dbseano.Text;

     If CbMes.ItemIndex < 10 Then
       wMes := dbseano.Text+'/0'+IntToStr(CbMes.ItemIndex+1)
     Else
       wMes := dbseano.Text+'/'+IntToStr(CbMes.ItemIndex+1);
//============================================================================
     sSQL :=
 'select faixas.descfaixa    Idade,'+
        'serpros1.quant      TIT_SERPROS,'+
        'serpros2.quant      DEP_SERPROS,'+
        'nvl(serpros1.quant,0)+nvl(serpros2.quant,0) TOTAL_SERPROS,'+
        'serpro1.quant       TIT_SERPRO,'+
        'serpro2.quant       DEP_SERPRO,'+
        'nvl(serpro1.quant,0)+nvl(serpro2.quant,0) TOTAL_SERPRO,'+
        'Assistido.quant     Assistidos,'+
        'nvl(serpros1.quant,0)+nvl(serpros2.quant,0)'+
         '+nvl(serpro1.quant,0)+nvl(serpro2.quant,0)'+
         '+nvl(Assistido.quant,0) Geral,'+
        'Total.quant         TotalGeral,'+
        'Cancelamentos.quant Cancelamentos,'+
        'Inclusoes.quant     Inclusoes '+
   'from faixas,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'DepenTit     dt,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (ppp.IdSitPart <> 7) '+
   'and (b.IdPessJur   = 1) '+
   'and (dt.iddependencia = ''PRP'') '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and (b.IdTitular    = dt.IdTitular) '+
   'and (b.IdDependente = dt.IdPessoa) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Serpros1,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'DepenTit     dt,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (ppp.IdSitPart <> 7) '+
   'and (b.IdPessJur   = 1) '+
   'and (dt.iddependencia <> ''PRP'') '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and (b.IdTitular    = dt.IdTitular) '+
   'and (b.IdDependente = dt.IdPessoa) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Serpros2,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'DepenTit     dt,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (ppp.IdSitPart <> 7) '+
   'and (b.IdPessJur = 99) '+
   'and (dt.iddependencia = ''PRP'') '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and (b.IdTitular    = dt.IdTitular) '+
   'and (b.IdDependente = dt.IdPessoa) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Serpro1,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'DepenTit     dt,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (ppp.IdSitPart <> 7) '+
   'and (b.IdPessJur = 99) '+
   'and (dt.iddependencia <> ''PRP'') '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and (b.IdTitular    = dt.IdTitular) '+
   'and (b.IdDependente = dt.IdPessoa) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Serpro2,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (ppp.IdSitPart  = 7) '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Assistido,'+
'(select count(*)     Quant '+
   'from BenefAss     b '+
 'where (b.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + '''))'+
 ') total,'+
 '(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') <= ''' + wmes + ''') '+ //??
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and (to_char(b.DtCancelamento,''yyyy/mm'') = ''' + wmes + ''') '+
 'group by f.idfaixas) Cancelamentos,'+
'(select f.idfaixas,'+
        'count(*)     Quant '+
   'from BenefAss     b,'+
        'PlanAss      pa,'+
        'PessoaFisica pf,'+
        'PartPrevPlan ppp,'+
        'Faixas       f '+
 'where (pa.IdPlanAss in (11, 3)) '+
   'and (to_char(b.DataEntrada,''yyyy/mm'') = ''' + wmes + ''') '+
   'and (b.IdPlanAss    = pa.IdPlanAss) '+
   'and (b.IdDependente = pf.IdPessoa) '+
   'and (trunc(months_between(Sysdate, pf.DataNasc)/12) '+
        'between f.inifaixa and f.fimfaixa) '+
   'and (b.IdTitular = ppp.IdPessoa(+)) '+
   'and (b.IdPessJur = ppp.IdPessJur(+)) '+
   'and ((b.DtCancelamento is null) or '+
        '(to_char(b.DtCancelamento,''yyyy/mm'') >= ''' + wmes + ''')) '+
 'group by f.idfaixas) Inclusoes '+
 'where (faixas.idfaixas = serpros1.idfaixas(+)) '+
   'and (faixas.idfaixas = serpros2.idfaixas(+)) '+
   'and (faixas.idfaixas = serpro1.idfaixas(+)) '+
   'and (faixas.idfaixas = serpro2.idfaixas(+)) '+
   'and (faixas.idfaixas = Assistido.idfaixas(+)) '+
   'and (faixas.idfaixas = Cancelamentos.idfaixas(+)) '+
   'and (faixas.idfaixas = Inclusoes.idfaixas(+)) '+
 'order by faixas.idfaixas';
 //============================================================================
     with dtmRelAssistencial.qryQuantPlanoSaude do
     begin
          close;
          sql.clear;
          sql.add(sSQL);
          screen.cursor := crHourGlass;
          open;
          screen.cursor := crDefault;
     end;
end;

procedure TfrmQuantBenefPlanoSaude.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  cbMes.SetFocus;
  dbseAno.Value := wAno;
end;

procedure TfrmQuantBenefPlanoSaude.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Criticar Dados
  If CbMes.ItemIndex = -1 Then
  Begin
       MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
       cbMes.SetFocus;
  End
  Else
     Fazqry;
end;

procedure TfrmQuantBenefPlanoSaude.FormShow(Sender: TObject);
begin
  inherited;
  // Mes e Ano Atual
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

end.

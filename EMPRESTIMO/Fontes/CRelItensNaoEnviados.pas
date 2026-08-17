unit CRelItensNaoEnviados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mMutuario;

type
   TcfgRelItensNaoEnviados = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molContratoEmptmo: TmolContratoEmptmo;
      chkFinanceiro: TCheckBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;

      procedure FormShow(Sender: TObject);


   private { Private declarations }

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelItensNaoEnviados: TcfgRelItensNaoEnviados;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   FProgresso,     (* FrmProgresso *)
   uMensErro, dRelItensNaoEnviados;





procedure TcfgRelItensNaoEnviados.MontaQuery;
begin
   inherited;

   with dtmRelItensNaoEnviados do
   begin
      sMesCobranca   := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensNaoEnviados.FiltraRelatorio;
begin

   (* filtro por Contrato *)

   with dtmRelItensNaoEnviados.qryItensNaoEnviados do
   begin
      LimpaParametros(dtmRelItensNaoEnviados.qryItensNaoEnviados);
      ParamByName('PHMEANOCOBRANCA').AsInteger := Trunc(DBspnAno.Value);
      ParamByName('PHMEMESCOBRANCA').AsInteger := cboMes.ItemIndex + 1;

      if molContratoEmptmo.IDContrato > 0 then
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

      if chkFinanceiro.Checked then ParamByName('PFINANCEIRO').AsInteger   := 1;
      if chkFolhaPatro.Checked then ParamByName('PFOLHAPATRO').AsInteger   := 1;
      if chkFolhaBenef.Checked then ParamByName('PFOLHABENEF').AsInteger   := 1;

      Open;
   end;
end;



procedure TcfgRelItensNaoEnviados.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContratoClick(Self);

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);
end;



end.

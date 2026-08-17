unit FCadProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, wwdblook, Wwdotdot,
  Wwdbcomb, Mask, wwdbedit, CmEventosCadastro, ImgList;

type
  TFrmCadProvento = class(TfrmCadastroGridCS)
    Label2: TLabel;
    Label5: TLabel;
    dbedDescricao: TwwDBEdit;
    dblkcmbflgAtrasoDevol: TwwDBComboBox;
    grpTipo: TGroupBox;
    chkVisivel: TCheckBox;
    rbNormal: TRadioButton;
    rbEspecial: TRadioButton;
    dbckINSS: TDBCheckBox;
    dbckFGTS: TDBCheckBox;
    dbckIRRF: TDBCheckBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    dbchkConsolida: TDBCheckBox;
    dbrgrpDesconto: TDBRadioGroup;
    pnlPrioridadeDesconto: TPanel;
    Label1: TLabel;
    dbedNumPrioridade: TDBEdit;
    GroupBox1: TGroupBox;
    dbckFLGDESCPENSAO: TDBCheckBox;
    Label6: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    qryInformerendimento: TwwQuery;
    Label7: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    qryIRRFDARF: TwwQuery;
    dbchkCompoeSalPart: TDBCheckBox;
    dbchkCompoeSalBenef: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    rdgBcalc: TRadioGroup;
    grpTipoRubrica: TGroupBox;
    chkGeral: TCheckBox;
    chkAssistencial: TCheckBox;
    chkEmprestimo: TCheckBox;
    chkPatrocinadora: TCheckBox;
    chkFolhaBeneficio: TCheckBox;
    chkFolhaPagaFunda: TCheckBox;
    procedure grpTipoExit(Sender: TObject);
    procedure rbEspecialClick(Sender: TObject);
    procedure rbNormalClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbrgrpDescontoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbrgrpDescontoChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject); // Alexandre - 08/08/2000
  private
       { Private declarations }
    procedure guardatiporubrica;   // Eduardo R. Pereira - 11/04/2001
    procedure PegaTipoRubrica;      // Eduardo R. Pereira - 12/04/2001
    procedure Limpa_Chek_Box_TpRubrica;  // Eduardo R. Pereira - 16/04/2001
  public
    { Public declarations }
     pidprovento : integer;
  end;

var
  FrmCadProvento: TFrmCadProvento;
  guardatiporubr : string;      // Eduardo R. Pereira
implementation

Uses Umenserro,UDatabase,FTelaAut, USistema;

{$R *.DFM}

procedure TFrmCadProvento.Limpa_Chek_Box_TpRubrica ;
Begin
  chkGeral.checked:=false;
  chkAssistencial.checked:=false;
  chkEmprestimo.checked:=false;
  chkPatrocinadora.checked:=false;
  chkFolhaBeneficio.checked:=false;
  chkFolhaPagaFunda.checked:=false;
end;
procedure TFrmCadProvento.grpTipoExit(Sender: TObject);
begin
  inherited;
  qry.FieldByName('FLGESPECIAL').AsInteger:=0;
  if rbEspecial.Checked then
  begin
    if chkVisivel.Checked then
      qry.FieldByName('FLGESPECIAL').AsInteger:=1
    else
      qry.FieldByName('FLGESPECIAL').AsInteger:=2;
  end;
end;

procedure TFrmCadProvento.rbEspecialClick(Sender: TObject);
begin
  inherited;
  chkVisivel.Visible:=not rbNormal.Checked;
end;

procedure TFrmCadProvento.rbNormalClick(Sender: TObject);
begin
  inherited;
  chkVisivel.Visible:= not rbNormal.Checked;
end;

procedure TFrmCadProvento.sbtnApagarClick(Sender: TObject);
begin
  if qry.FieldbyName('flgInterno').AsInteger = 1
  then begin
     MsgDlg('Esta rubrica não pode ser excluída.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;
  inherited;   
end;

procedure TFrmCadProvento.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  grpTipoRubrica.enabled:=true;
  
  rbNormal.Checked   := (qry.FieldByName('FLGESPECIAL').AsInteger=0);
  rbEspecial.Checked := (qry.FieldByName('FLGESPECIAL').AsInteger<>0);
  chkVisivel.Visible := (qry.FieldByName('FLGESPECIAL').AsInteger<>0);
  chkVisivel.Checked := (qry.FieldByName('FLGESPECIAL').AsInteger=1);
  if qry.FieldByName('FLGDESCPENSAO').AsString = '' then
     qry.FieldByName('FLGDESCPENSAO').AsInteger := 0;
  if qry.FieldByName('FLGCOMPOEREMTOTAL').AsString = '' then
     qry.FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;

  //by Vlad - inicio
  if Qry.FieldbyName('FLGSALPARTRETRO').AsString = '' then
     Qry.FieldbyName('FLGSALPARTRETRO').AsInteger := 0;
  if Qry.FieldbyName('FLGSALBENEFRETRO').AsString = '' then
     Qry.FieldbyName('FLGSALBENEFRETRO').AsInteger := 0;
  if Qry.FieldbyName('FLGSALPARTATUARIA').AsString = '' then
     Qry.FieldbyName('FLGSALPARTATUARIA').AsInteger := 0;
  //by Vlad - Fim

  pidprovento := QRY.FIELDBYNAME('IDPROVENTO').ASINTEGER; // Eduardo R. Pereira

  rdgBCalc.Enabled := true;
end;

procedure TFrmCadProvento.dbrgrpDescontoClick(Sender: TObject);
begin
  inherited;
  if dbrgrpDesconto.ItemIndex = 0
  then begin// Provento
     dbedNumPrioridade.Text := '';
     pnlPrioridadeDesconto.Visible := False;
     dbckIRRF.Visible := True; // nao é desconto -> tem IRRF
  end
  else begin
     if dbrgrpDesconto.ItemIndex = 1 // Desconto
     then begin
        pnlPrioridadeDesconto.Visible := True;
        dbckIRRF.Checked := False;
        dbckIRRF.Visible := True; // é desconto -> tem IRRF (alterado por Pierre em 13/03)
        rdgBCalc.Visible := true; // Inclusão rdgBCalc  - Lise  01/02/2001
     end;
  end;
end;

// Guarda os tipos de Rubricas selecionados pelo usuário - // Eduardo R. Pereira - 10/04/2001
procedure TFrmCadProvento.guardatiporubrica;
begin
  guardatiporubr:= '';
  if chkGeral.Checked=true then
    guardatiporubr:= guardatiporubr + 'G';
  if chkAssistencial.Checked=true then
    guardatiporubr:= guardatiporubr + 'A';
  if chkEmprestimo.Checked=true then
    guardatiporubr:= guardatiporubr + 'E';
  if chkPatrocinadora.Checked=true then
    guardatiporubr:= guardatiporubr + 'P';
  if chkFolhaBeneficio.Checked=true then
    guardatiporubr:= guardatiporubr + 'B';
  if chkFolhaPagaFunda.Checked=true then
    guardatiporubr:= guardatiporubr + 'F';
end;

procedure TFrmCadProvento.bbtnConfirmarClick(Sender: TObject);
begin
    guardatiporubrica;
  // Testar campos obrigatorios
  if Trim(dbedDescricao.Text) = ''
  then begin
     MsgDlg('Nome da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if dbrgrpDesconto.ItemIndex < 0
  then begin
     MsgDlg('Finalidade da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  qry.FieldByName('IDPROVENTO').AsInteger :=  pidprovento;

  if rbNormal.Checked then
  qry.FieldByName('FLGESPECIAL').AsInteger := 0
  else
    if chkVisivel.checked then
       qry.FieldByName('FLGESPECIAL').AsInteger := 2
    else qry.FieldByName('FLGESPECIAL').AsInteger := 1;

      // Fernando
  If dbrgrpdesconto.ItemIndex = 1 then
     Case rdgBCalc.ItemIndex of
          0: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 1;
          1: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 2;
          2: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 3;
          3: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 4;
          4: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 5;
     end
  else
      qry.FieldByname('TIPOBASEDESCONTO').asInteger := 0;
      rdgBCalc.Enabled := false;

      qry.fieldbyname('FLGTPRUBRICA').asstring:= guardatiporubr;   
  inherited;
end;

procedure TFrmCadProvento.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  // Eduardo R.Pereira
  grpTipoRubrica.enabled:=true;
  Limpa_Chek_Box_TpRubrica;

  pidprovento := LeUltRegistro(nil,'PROVDESC');
  with qry do
  begin
     FieldByName('FLGINSS').AsInteger := 0 ;
     FieldByName('FLGFGTS').AsInteger := 0 ;
     FieldByName('FLGIRRF').AsInteger := 0 ;
     FieldByName('FLGCONSOLIDA').AsInteger := 0 ;
     FieldByName('FLGOBRIGAFAVOREC').AsInteger := 0 ;
     FieldByName('FLGCONSTAFOLHA').AsInteger := 0 ;
     FieldByName('FLGCOMPOESALPART').AsInteger := 0 ;
     FieldByName('FLGCOMPOESALBENEF').AsInteger := 0 ;
     FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0 ;
     FieldByName('FLGDESCPENSAO').AsInteger := 0 ;

     //by Vlad - inicio
     FieldbyName('FLGSALPARTRETRO').AsInteger := 0;
     FieldbyName('FLGSALBENEFRETRO').AsInteger := 0;
     FieldbyName('FLGSALPARTATUARIA').AsInteger := 0;
     //by Vlad - Fim

      // Fernando
     rdgBCalc.ItemIndex := -1;
     rdgBCalc.Visible   := false;
  end;
end;

procedure TFrmCadProvento.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qry.FieldByName('FlgEspecial').AsString = '') or
     ((qry.FieldByName('FlgEspecial').AsInteger <> 1) and  (qry.FieldByName('FlgEspecial').AsInteger <> 1) )
  then qry.FieldByName('FlgEspecial').AsInteger := 0;

  qry.FieldByName('IDModulo').AsInteger := Sistema.IDModulo;
end;

// Função para pegar o Tipo de Rubrica no retorno da busca - Eduardo R.Pereira -12/04/2001
procedure  TFrmCadProvento.PegaTipoRubrica;
var i :  integer;
begin
  for i:= 1 to Length(qry.fieldbyname('FLGTPRUBRICA').asstring) do
    begin
      Case  qry.fieldbyname('FLGTPRUBRICA').asstring[i] of

           'G': chkGeral.Checked:=true;
           'A': chkAssistencial.Checked:=true;
           'E': chkEmprestimo.Checked:=true;
           'P': chkPatrocinadora.Checked:=true;
           'B': chkFolhaBeneficio.Checked:=true;
           'F': chkFolhaPagaFunda.checked:=true;
      end;
    end;
end;

// by Alexandre - Inicio - 08/08/2000
procedure TFrmCadProvento.sbtnProcurarClick(Sender: TObject);
begin
  Limpa_Chek_Box_TpRubrica;

 // MontaSelect.Filtro.Add('PROVDESC.IDMODULO = '+IntToStr(SISTEMA.IDMODULO));
  inherited;

  PegaTipoRubrica;

  grpTipoRubrica.Enabled:=false;

  // Fernando
  If ((qry.FieldByName('FLGDESCONTO').AsInteger = 0) or
     (qry.FieldByName('FLGDESCONTO').AsInteger = 2)) then
          rdgbCalc.Visible := false
  else begin
          rdgbCalc.Visible := true;
          Case qry.FieldByname('TIPOBASEDESCONTO').asInteger of
             1: rdgBCalc.ItemIndex := 0;
             2: rdgBCalc.ItemIndex := 1;
             3: rdgBCalc.ItemIndex := 2;
             4: rdgBCalc.ItemIndex := 3;
             5: rdgBCalc.ItemIndex := 4;
          Else
              rdgBCalc.ItemIndex := -1;
          end;
          rdgbCalc.Enabled := false;
  end;
end;

Procedure TFrmCadProvento.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  if MontaSelect.RetornouValor then
  begin
    With qry do
    begin
      Close;
      ParamByName('IDPROVENTO').AsString := MontaSelect.ValoresChave[0];
      Open;
    end;
  end;
End;

// by Alexandre - Fim

procedure TFrmCadProvento.FormShow(Sender: TObject);
begin
  inherited;
  rdgBCalc.Visible := false;
end;

procedure TFrmCadProvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  rdgBCalc.Enabled := false;
end;

procedure TFrmCadProvento.dbrgrpDescontoChange(Sender: TObject);
begin
  inherited;
  If dbrgrpDesconto.itemindex = 1 then begin
     rdgBCalc.Visible  := true;
     rdgBCalc.Enabled  := true;
  end else begin
      rdgBCalc.Visible := false;
      rdgBCalc.Enabled := false;
  end;
  rdgBCalc.ItemIndex := -1;
end;

procedure TFrmCadProvento.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  grpTipoRubrica.enabled:=false;
end;

end.

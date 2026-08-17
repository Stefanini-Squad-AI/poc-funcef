// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Claudio Faria
// Data      : 25/05/2007
// Pendência : 19701
// Alteração : Retirar os botões Incluir e Excluir pois não tem função nessa tela
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.10.2004
// Alteração   : Altearcao nas querys qryRubricaDevol e qryRubricaNormal
//               para filtrar rubricas do tipo B e não P
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO         
//------------------------------------------------------------------------------
// Autor(a)  : Camille
// Criação   : 01.04.2002
// Objetivo  : Cadastrar alteradores por benefício, por exemplo, juros, multa,
//             e outros alteradores a serem utilizados no pagamento de benefícios
//             atrasados e na cobrança de devoluções de benefícios
// -----------------------------------------------------------------------------

// *****************************************************************************
unit FCadAlteradorBenefCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  wwdbedit, DBCtrls, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadAlteradorBenefCS = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryRegra: TwwQuery;
    qryAlterador: TwwQuery;
    dbrgrpAtrasoDevol: TDBRadioGroup;
    Label4: TLabel;
    dblkpcmbAlterador: TwwDBLookupCombo;
    Label3: TLabel;
    dblkpcmbRegra: TwwDBLookupCombo;
    Label5: TLabel;
    dbedNumOrdem: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbchkDesativa: TDBCheckBox;
    dbhckResserva: TDBCheckBox;
    qryRubricaNormal: TwwQuery;
    qryRubricaDevol: TwwQuery;
    Label6: TLabel;
    dblkpcmbRubNormal: TwwDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    dblkpcmbRubDevol: TwwDBLookupCombo;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbrgrpAtrasoDevolClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadAlteradorBenefCS: TfrmCadAlteradorBenefCS;

implementation

uses UAdmPrev, UMensErro, UDataBase, usistema;

{$R *.DFM}

procedure TfrmCadAlteradorBenefCS.CmeCadastroFind(Sender: TObject);
var  sIdPlanoPrev, sIDBENEFICIO : string;
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPlanoPrev    := MontaSelect.ValoresChave[0];
     sIDBENEFICIO := MontaSelect.ValoresChave[1];

     qry.Close;
     qry.ParamByName('IdPlanoPrev').Value    := StrToInt(sIdPlanoPrev);
     qry.ParamByName('IDBENEFICIO').Value := StrToInt(sIDBENEFICIO);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPlanoPrev').Value    := StrToInt(sIdPlanoPrev);
     qryDet.ParamByName('IDBENEFICIO').Value := StrToInt(sIDBENEFICIO);
     qryDet.Open;
  end;
end;

procedure TfrmCadAlteradorBenefCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryAlterador.Close;
  qryAlterador.ParamByName('RecPag').AsString := 'P';
  qryAlterador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 21.06.2003
  qryAlterador.Open;


  dbrgrpAtrasoDevol.ItemIndex := 0;
  dbchkDesativa.Checked := False;
  dbhckResserva.Checked := False;

  with qryRubricaNormal do
  begin
     Close;
     ParamByName('FLGDESCONTO').AsInteger := 0;
     Open;
  end;

  with qryRubricaDevol do
  begin
     Close;
     ParamByName('FLGDESCONTO').AsInteger := 1;
     Open;
  end;
end;

procedure TfrmCadAlteradorBenefCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if qryDet.FieldByName('FLGCOBRA').AsString    = ''
  then qryDet.FieldByName('FLGCOBRA').AsInteger := 0;

  if qryDet.FieldByName('FLGCALCRESERVA').AsString    = ''
  then qryDet.FieldByName('FLGCALCRESERVA').AsInteger := 0;
end; 

procedure TfrmCadAlteradorBenefCS.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([qryDet]);
   except
      raise;
   end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
   
end; 

procedure TfrmCadAlteradorBenefCS.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end;


procedure TfrmCadAlteradorBenefCS.sbtnInserirClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a manipulação dos alteradores. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnInserir.Down := False;
  Abort;
  inherited;

end;

procedure TfrmCadAlteradorBenefCS.sbtnApagarClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a manipulação dos alteradores. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnApagar.Down := False;
  Abort;
  inherited;
end;

procedure TfrmCadAlteradorBenefCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IdPlanoPrev').Value  := 0;
  qry.ParamByName('IDBENEFICIO').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPlanoPrev').Value  := 0;
  qryDet.ParamByName('IdPlanoPrev').Value := 0;
  qryDet.Open;

  qryRegra.Close;
  qryRegra.Open;

  qryAlterador.Close;
  qryAlterador.ParamByName('RecPag').AsString := 'P';
  qryAlterador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 21.06.2003
  qryAlterador.Open;

  with qryRubricaNormal do
  begin
     Close;
     ParamByName('FLGDESCONTO').AsInteger := 0;
     Open;
  end;

  with qryRubricaDevol do
  begin
     Close;
     ParamByName('FLGDESCONTO').AsInteger := 1;
     Open;
  end;

end;

procedure TfrmCadAlteradorBenefCS.dbrgrpAtrasoDevolClick(
  Sender: TObject);
begin
  inherited;
   qryAlterador.Close;
   if dbrgrpAtrasoDevol.ItemIndex = 0
   then qryAlterador.ParamByName('recpag').AsString := 'P'
   else qryAlterador.ParamByName('recpag').AsString := 'R';
   qryAlterador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
   qryAlterador.Open;

   if dbrgrpAtrasoDevol.ItemIndex = 0 
   then begin
      with qryRubricaNormal do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 0;
         Open;
      end;

      with qryRubricaDevol do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 1;
         Open;
      end;
   end
   else begin 
      with qryRubricaNormal do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 1;
         Open;
      end;

      with qryRubricaDevol do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 0;
         Open;
      end;
   end;

end;

procedure TfrmCadAlteradorBenefCS.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryDet.Active then Exit;
  qryAlterador.Close;
  if qryDet.FieldByName('FLGATRASO').AsInteger = 1
  then qryAlterador.ParamByName('recpag').AsString := 'P'
  else qryAlterador.ParamByName('recpag').AsString := 'R';
  qryAlterador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryAlterador.Open;

   if qryDet.FieldByName('FLGATRASO').AsInteger = 1
   then begin
      with qryRubricaNormal do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 0;
         Open;
      end;

      with qryRubricaDevol do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 1;
         Open;
      end;
   end
   else begin 
      with qryRubricaNormal do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 1;
         Open;
      end;

      with qryRubricaDevol do
      begin
         Close;
         ParamByName('FLGDESCONTO').AsInteger := 0;
         Open;
      end;
   end;


end;

procedure TfrmCadAlteradorBenefCS.bbtnOkDetClick(Sender: TObject);
begin
  if Trim(dblkpcmbAlterador.Text) = ''
  then begin
     MsgDlg('Alterador não selecionado.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbAlterador.SetFocus;
     abort;
  end;

  if Trim(dblkpcmbRegra.Text) = ''
  then begin
     MsgDlg('Regra não selecionada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     abort;
  end;

  if Trim(dbedNumOrdem.Text) = ''
  then begin
     MsgDlg('Número de Ordem de Cálculo não informado.','Erro',mtError,[mbOk,mbHelp],0);
     dbedNumOrdem.SetFocus;
     abort;
  end;
    
  qryDet.FieldByName('DESCRICAO').AsString := dblkpcmbAlterador.Text;
  inherited;
end;

procedure TfrmCadAlteradorBenefCS.qryDetBeforePost(DataSet: TDataSet);
begin
  if dbrgrpAtrasoDevol.ItemIndex = 0
  then begin
     qryDet.FieldByName('flgatraso').Asinteger := 1;
     qryDet.FieldByName('flgdevol').Asinteger  := 0;
  end
  else begin
     qryDet.FieldByName('flgatraso').Asinteger := 0;
     qryDet.FieldByName('flgdevol').Asinteger  := 1;
  end;

  qryDet.FieldByName('IdPlanoPrev').AsInteger    := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryDet.FieldByName('IDBENEFICIO').AsInteger := qry.FieldByName('IDBENEFICIO').AsInteger;
  inherited;
end;

procedure TfrmCadAlteradorBenefCS.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add(' PL.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+ 
                         '                    WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                         '                    AND     PLP.IDPESSJUR = P.IDPESSOA ) OR                 '+
                         ' NOT EXISTS (SELECT 1 FROM PLANPREVPATRO PLP WHERE PLP.IDPLANOPREV = PL.IDPLANOPREV) ');

end;

end.

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 11/12/2002
// Alteração   : Coloquei um alter join na qryDet para regra
// *****************************************************************************
unit FCadParamSal13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, Spin, Mask, wwdbedit, Wwdbspin;

type
  TFrmCadParamSal13 = class(TfrmCadMestreDetalheCS)
    lblPatro: TLabel;
    dblkpcmbPatrocinadora: TwwDBLookupCombo;
    lblExercicio: TLabel;
    grpMesAno: TGroupBox;
    lblAnoMes: TLabel;
    lblMes: TLabel;
    seAno: TSpinEdit;
    cboxMes: TComboBox;
    dblkpcmbRubrica: TwwDBLookupCombo;
    dblkpcmbRegra: TwwDBLookupCombo;
    lblRubrica: TLabel;
    lblRegra: TLabel;
    qryRubrica: TwwQuery;
    qryRegra: TwwQuery;
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    dsrubrica: TwwDataSource;
    dsRegra: TwwDataSource;
    wwDBSpinEdtexercicio: TwwDBSpinEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbPatrocinadoraChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBSpinEdtexercicioChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure wwDBSpinEdtexercicioBeforeUpClick(Sender: TObject);
    procedure wwDBSpinEdtexercicioBeforeDownClick(Sender: TObject);
  private
    { Private declarations }
    MesAno  : String;
    bMudou,
    bDown   : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadParamSal13: TFrmCadParamSal13;

implementation

uses UCalcDV, UMensErro,UDataBase, Usistema, UAdmPrev;

{$R *.DFM}   

procedure TFrmCadParamSal13.bbtnOkDetClick(Sender: TObject);
Var
  sSQL, Mes :String;
  Altera : Char;
begin   
  //Critica Dados
  if cboxMes.Text = '' then
   begin
     MsgDlg('Informar Mês.','Erro',mtError,[mbOk,mbHelp],0);
     cboxMes.SetFocus;
     Abort;
   end;

   if dblkpcmbRubrica.Text = '' then
   begin
     MsgDlg('Informar a Rubrica.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRubrica.SetFocus;
     Abort;
   end;


   // Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) <= 9 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

  MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;


  // Atribuir dados Principal a QryDet
  qryDet.FieldByName('IDPESSJUR').AsString  := dblkpcmbPatrocinadora.LookupValue;
  qryDet.FieldByName('EXERCICIO').AsFloat   := wwDBSpinEdtexercicio.Value ;
  qryDet.FieldByName('MESREFERENCIA').AsString := MesAno;

  Altera := 'N';
  if sbtnAltDet.Down = true then begin
    Altera := 'S';
  end;

   //Post
  inherited;

  If Altera = 'S' Then Begin
    qryDet.Close;
    qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
    qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
    qryDet.Open;
  end;

  If Altera <> 'S' Then
   cboxMes.text := '';
end;

procedure TFrmCadParamSal13.bbtnConfirmarClick(Sender: TObject);
Var
  Altera : Char;
begin
 
  sbtnAlterar.Down := false;
  sbtnAlterar.Enabled := True;
  sbtnProcurar.Enabled := True;
  QryDet.ApplyUpdates;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
  qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
  qryDet.Open;

end;

procedure TFrmCadParamSal13.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count <=  0) or (MontaSelect.ValoresChave[0] = '')
  then Exit;

  //Atribui valores da pesquisa aos parâmetros da Query
  qry.Close;
  qry.ParamByName('IDPESSJUR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.ParamByName('EXERCICIO').Value   := StrToInt(MontaSelect.ValoresChave[1]);
  qry.Open;

  dblkpcmbPatrocinadora.LookupValue := MontaSelect.ValoresChave[0];
  wwDBSpinEdtexercicio.Value := StrToInt(MontaSelect.ValoresChave[1]);
end;

procedure TFrmCadParamSal13.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PARAMSAL13.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  pnlMestre.Enabled := True;
  sbtnAlterar.Enabled := True;

  // Tornar Invisíveis Botões
  sbtnInserir.Visible := False;
  sbtnApagar.Visible := False;

  //Abrir Querys
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  qryRegra.Open;
end;

procedure TFrmCadParamSal13.dblkpcmbPatrocinadoraChange(Sender: TObject);
begin
  inherited;
              
  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
  qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
  qryDet.Open;

  qryRubrica.Close;
  qryRubrica.ParamByName('IDPESSJUR').AsString := dblkpcmbPatrocinadora.LookupValue;
  qryRubrica.Open;
end;

procedure TFrmCadParamSal13.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  //Fechar Querys
  qryPatro.Close;
  qryRegra.Close;
end;

procedure TFrmCadParamSal13.wwDBSpinEdtexercicioChange(Sender: TObject);
begin
  inherited;

  If bMudou
  Then Exit;

  If Trim(dblkpcmbPatrocinadora.Text) = '' Then
  Begin

    MsgDlg('Escolha primeiro a patrocinadora','Aviso',mtWarning,[mbOk],0);

    bMudou := True;

    If bDown
    Then wwDBSpinEdtexercicio.Value := wwDBSpinEdtexercicio.Value + 1
    Else wwDBSpinEdtexercicio.Value := wwDBSpinEdtexercicio.Value - 1;

    Exit;
  End;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
  qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
  qryDet.Open;
end;

procedure TFrmCadParamSal13.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
  qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
  qryDet.Open;
end;

procedure TFrmCadParamSal13.sbtnAltDetClick(Sender: TObject);
Var
  Mes : String;
begin
  seAno.text     :=  Copy(qryDet.FieldByName('EXERCICIO').Value,1,4 ) ;

  Case StrToInt(Copy(qryDet.FieldByName('MESREFERENCIA').Value,6,2)) of

    01 : cboxMes.Text := 'Janeiro';
    02 : cboxMes.Text := 'Fevereiro';
    03 : cboxMes.Text := 'Março';
    04 : cboxMes.Text := 'Abril';
    05 : cboxMes.Text := 'Maio';
    06 : cboxMes.Text := 'Junho';
    07 : cboxMes.Text := 'Julho';
    08 : cboxMes.Text := 'Agosto';
    09 : cboxMes.Text := 'Setembro';
    10 : cboxMes.Text := 'Outubro';
    11 : cboxMes.Text := 'Novembro';
    12 : cboxMes.Text := 'Dezembro';
  end;

  cboxMes.Enabled := False;
  seAno.Enabled := False;

  inherited;
end;

procedure TFrmCadParamSal13.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  cboxMes.Text := '';
  cboxMes.Enabled := True;
  seAno.Enabled := True;
end;

procedure TFrmCadParamSal13.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := dblkpcmbPatrocinadora.LookupValue;
  qryDet.ParamByName('EXERCICIO').Value   := wwDBSpinEdtexercicio.Value ;
  qryDet.Open;
end;             

procedure TFrmCadParamSal13.sbtnExcluiDetClick(Sender: TObject);
begin

  if (MsgDlg('Deseja realmente excluir este registro?','Exclusão',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      QryDet.Delete;
end;

procedure TFrmCadParamSal13.qryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  If QryDet.UpdatesPending Then Begin
     QryDet.ApplyUpdates;
     QryDet.CommitUpdates;
    end;
end;

procedure TFrmCadParamSal13.bbtnCancelarClick(Sender: TObject);
begin
 inherited;
 qrydet.CancelUpdates;
end;

procedure TFrmCadParamSal13.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TFrmCadParamSal13.wwDBSpinEdtexercicioBeforeUpClick(
  Sender: TObject);
begin
  inherited;
  bMudou := False;
  bDown  := False;
end;

procedure TFrmCadParamSal13.wwDBSpinEdtexercicioBeforeDownClick(
  Sender: TObject);
begin
  inherited;
  bMudou := False;
  bDown  := True;
end;

end.



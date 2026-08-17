//Alterações
//==============================================================================
//Autor.........: Ricardo de Freitas Araújo
//Rotina........: Formula´rio de Cadastro.
//SOL...........: 134353
//Kintana.......: 790561
//Atualização...: Form
//==============================================================================

unit FCadAssociacaoContribAno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ExtCtrls, ImgList, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97Ctls, TB97,Grids, Wwdbigrd, Wwdbgrid,uCmControlObject,
  uCtrlCadAssociacaoContribAno,uCtrlPadroes,DBGrids, MontaSelect;

type
  TFrmCadAssociacaoContribAno = class(TForm)
    cdsContrDisp: TClientDataSet;
    cdsContrSel: TClientDataSet;
    dsContrDisp: TDataSource;
    dsContrSel: TDataSource;
    Dock972: TDock97;
    tool_1: TToolbar97;
    btnInserir: TToolbarButton97;
    btnProcurar: TToolbarButton97;
    Dock971: TDock97;
    tool_tb97Fundo: TToolbar97;
    tlbrsp97sep1: TToolbarSep97;
    tlbrsp97sep3: TToolbarSep97;
    btnSair: TBitBtn;
    mhlpbtbtnAjuda: TmaHelpBitBtn;
    tool_TB97oKCancelar: TToolbar97;
    tlbrsp: TToolbarSep97;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    ilImlPadrao: TImageList;
    pnlFundo: TPanel;
    lblAno: TLabel;
    edtAno: TEdit;
    btnListar: TBitBtn;
    btnVaiUm2: TBitBtn;
    btnVoltaUm2: TBitBtn;
    pnlContribuicaoAno: TPanel;
    pnlContribuicaoSelec: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    lblContrDisp: TLabel;
    lblContrSel: TLabel;
    MontaSelect: TMontaSelect;
    btnReplicar: TToolbarButton97;
    procedure btnListarClick(Sender: TObject);
    procedure btnVaiUm2Click(Sender: TObject);
    procedure btnVoltaUm2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure dbgrd2TitleClick(Column: TColumn);
    procedure btnProcurarClick(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure btnReplicarClick(Sender: TObject);
    procedure edtAnoEnter(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
    procedure edtAnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure TrancaTela(cond:Boolean);
    procedure TrancaBarra(cond:Boolean);
  public
    { Public declarations }
    CtrlCadAssociacaoContribAno: TCtrlCadAssociacaoContribAno;
  end;

var
  FrmCadAssociacaoContribAno: TFrmCadAssociacaoContribAno;

implementation

{$R *.DFM}

procedure TFrmCadAssociacaoContribAno.btnListarClick(Sender: TObject);
var
  Ano:integer;
begin
  if Trim(edtAno.Text) = '' then
  begin
     Application.MessageBox('Informar o ano das contribuições!','Atenção',48);
     edtAno.SetFocus;
     Exit;
  end;

  Ano := StrtoIntDef(edtAno.text,0);

  if (Ano < 1000) or (Ano > 9999) then
     Ano := 0;

  if (Ano = 0) then
  begin
     Application.MessageBox('Ano informado inválido.','Atenção',48);
     edtAno.SetFocus;
     Exit;
  end;

  TRY
     Screen.Cursor := crHourGlass;

     //Contribuição Disponível
     cdsContrDisp.Data    := CtrlCadAssociacaoContribAno.ListarContrDisponivel(Ano);
     lblContrDisp.Caption := 'Total: ' + IntToStr(cdsContrDisp.RecordCount);

     //Contribuição Selecionados
     cdsContrSel.Data     := CtrlCadAssociacaoContribAno.ListarContrAno(Ano);
     lblContrSel.Caption  := 'Total: ' + IntToStr(cdsContrSel.RecordCount);

  finally
     Screen.Cursor := crDefault;
  end;

  //Controles
  btnConfirmar.Enabled := true;
  TrancaTela(True);
  Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.btnVaiUm2Click(Sender: TObject);
begin
  if (cdsContrDisp.IsEmpty) then
  begin
     Application.MessageBox('Não há contribuições disponíveis.','Atenção',48);
     Exit;
  end;

  //Disponível para Selecionado
  cdsContrSel.Insert;
  cdsContrSel.FieldByName('IDCONTRIBUICAO').AsInteger       := cdsContrDisp.fieldbyname('IDCONTRIBUICAO').AsInteger;
  cdsContrSel.FieldByName('IDTPPERIODICIDADE').AsInteger    := cdsContrDisp.fieldbyname('IDTPPERIODICIDADE').AsInteger;
  cdsContrSel.FieldByName('IDBENEFICIO').AsInteger          := cdsContrDisp.fieldbyname('IDBENEFICIO').AsInteger;
  cdsContrSel.FieldByName('IDTPCONTRIBUICAO').AsString      := cdsContrDisp.fieldbyname('IDTPCONTRIBUICAO').AsString;
  cdsContrSel.FieldByName('NOME').AsString                  := cdsContrDisp.fieldbyname('NOME').AsString;
  cdsContrSel.FieldByName('IDCONTRIBUICAOPGA').AsString     := cdsContrDisp.fieldbyname('IDCONTRIBUICAOPGA').AsString;
  cdsContrSel.FieldByName('PERIODICIDADE').AsString         := cdsContrDisp.fieldbyname('PERIODICIDADE').AsString;
  cdsContrSel.FieldByName('BENEFICIO').AsString             := cdsContrDisp.fieldbyname('BENEFICIO').AsString;
  cdsContrSel.Post;
  cdsContrDisp.Delete;

  lblContrDisp.Caption := 'Total: ' + IntToStr(cdsContrDisp.RecordCount);
  lblContrSel.Caption  := 'Total: ' + IntToStr(cdsContrSel.RecordCount);

  Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.btnVoltaUm2Click(Sender: TObject);
begin
  if (cdsContrSel.IsEmpty) then
  begin
     Application.MessageBox('Não há contribuições selecionadas.','Atenção',48);
     Exit;
  end;

  //Selecionado para Disponível
  cdsContrDisp.Insert;
  cdsContrDisp.FieldByName('IDCONTRIBUICAO').AsInteger       := cdsContrSel.fieldbyname('IDCONTRIBUICAO').AsInteger;
  cdsContrDisp.FieldByName('IDTPPERIODICIDADE').AsInteger    := cdsContrSel.fieldbyname('IDTPPERIODICIDADE').AsInteger;
  cdsContrDisp.FieldByName('IDBENEFICIO').AsInteger          := cdsContrSel.fieldbyname('IDBENEFICIO').AsInteger;
  cdsContrDisp.FieldByName('IDTPCONTRIBUICAO').AsString      := cdsContrSel.fieldbyname('IDTPCONTRIBUICAO').AsString;
  cdsContrDisp.FieldByName('NOME').AsString                  := cdsContrSel.fieldbyname('NOME').AsString;
  cdsContrDisp.FieldByName('IDCONTRIBUICAOPGA').AsString     := cdsContrSel.fieldbyname('IDCONTRIBUICAOPGA').AsString;
  cdsContrDisp.FieldByName('PERIODICIDADE').AsString         := cdsContrSel.fieldbyname('PERIODICIDADE').AsString;
  cdsContrDisp.FieldByName('BENEFICIO').AsString             := cdsContrSel.fieldbyname('BENEFICIO').AsString;
  cdsContrDisp.Post;
  cdsContrSel.Delete;

  lblContrDisp.Caption := 'Total: ' + IntToStr(cdsContrDisp.RecordCount);
  lblContrSel.Caption  := 'Total: ' + IntToStr(cdsContrSel.RecordCount);

  Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.TrancaTela(cond: Boolean);
begin
  pnlContribuicaoSelec.Visible := cond;
  pnlContribuicaoAno.Visible   := cond;
  btnVaiUm2.Visible            := cond;
  btnVoltaUm2.Visible          := cond;
  edtAno.Enabled               := cond;
  btnListar.Enabled            := cond;
  lblAno.Enabled               := cond;
  Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.FormCreate(Sender: TObject);
begin
  CtrlCadAssociacaoContribAno := TCtrlCadAssociacaoContribAno.Create;
  CtrlCadAssociacaoContribAno.InitializeAs(Padroes);
  TrancaTela(false);
end;

procedure TFrmCadAssociacaoContribAno.btnCancelarClick(Sender: TObject);
begin
  edtAno.Clear;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled  := false;
  //Controles
  TrancaBarra(true);
  TrancaTela(False);
end;

procedure TFrmCadAssociacaoContribAno.btnInserirClick(Sender: TObject);
begin
  edtAno.Clear;

  //Controles
  TrancaBarra(false);
  TrancaTela(true);
  btnCancelar.Enabled := True;

  if edtAno.CanFocus then
     edtAno.SetFocus;

  Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsContrDisp.CLose;
     cdsContrSel.CLose;
     FreeAndNil(CtrlCadAssociacaoContribAno);
end;

procedure TFrmCadAssociacaoContribAno.btnConfirmarClick(Sender: TObject);
var
   Accept:Boolean;
begin

     //Consistência
     if cdsContrSel.IsEmpty then
     begin
        if Application.MessageBox(PChar('Não foi selecionado nenhuma contribuição para o ano.' + #13 +
                                        'Com isso o ano ' + Trim(edtAno.text) + ' ficará sem contribuições vinculadas.' + #13 + #13 +
                                        'Deseja prosseguir?') ,'Confirmar',36) <> 6 then
           Exit;
     end;

     TRY
        Screen.Cursor :=  crHourGlass;
        Accept := CtrlCadAssociacaoContribAno.GravarContrAno(StrToInt(edtAno.Text),cdsContrSel);

        if Accept then
        begin
           if (cdsContrSel.RecordCount > 0) then
           begin
                Application.MessageBox(pchar('Contribuições vinculados ao ano ' + Trim(edtAno.Text) + ' com sucesso.'),
                                             'Informação',48)
           end;
        end
        else
           Application.MessageBox(pchar('Ocorreu um erro ao vincular contribuições ao ano ' + Trim(edtAno.Text)),'Informação',48);
     FINALLY
        Screen.Cursor :=  crDefault;
     END;

     //Controles
     TrancaBarra(true);
     TrancaTela(False);

     btnConfirmar.Enabled := false;
     btnCancelar.Enabled  := false;
end;

procedure TFrmCadAssociacaoContribAno.btnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmCadAssociacaoContribAno.dbgrd1TitleClick(Column: TColumn);
begin
     if (dbgrd1.DataSource.DataSet as TClientDataSet).Active then
        (dbgrd1.DataSource.DataSet as TClientDataSet).IndexFieldNames := Column.FieldName;
end;

procedure TFrmCadAssociacaoContribAno.dbgrd2TitleClick(Column: TColumn);
begin
     if (dbgrd2.DataSource.DataSet as TClientDataSet).Active then
        (dbgrd2.DataSource.DataSet as TClientDataSet).IndexFieldNames := Column.FieldName;
end;

procedure TFrmCadAssociacaoContribAno.btnProcurarClick(Sender: TObject);
begin
     MontaSelect.Executar;
     if MontaSelect.RetornouValor then
     begin
          btnInserir.Click();
          edtAno.Text := Trim(MontaSelect.ValoresChave[0]);
          btnListar.Click();
     end;
end;

procedure TFrmCadAssociacaoContribAno.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
   iOrderBy:integer;
   sSQL: TStrings;
begin

     //Adicionando clásula GROUP BY por causa do componente MontaSelect
     TRY
       sSQL      := TStringList.Create;
       sSQL.Text := sqlText;
       iOrderBy := (sSQL.Count - 1);
       sSQL.Strings[iOrderBy]     := ' GROUP BY CM.CONTRIBUICAO_ANO.ANO ';
       sqlText := sSQL.Text;


     finally
       FreeAndNil(sSQL);
     end;

end;

procedure TFrmCadAssociacaoContribAno.btnReplicarClick(Sender: TObject);
var
   Accept:Boolean;
   sMsg: string;
   iAnoUltimo,iAnoSeguinte:integer;
begin
   //Conforme RM
   //5.5. A opção de replicar somente estará disponível quando um ano,
   //que não possui relacionamento com contribuição, for informado pelo usuário
   //e for seguinte ao último ano cadastrado associado a contribuições.
   TRY
      sMsg := 'A opção de replicar somente estará disponível quando um ano, '              + #13 +
              'que não possui relacionamento com contribuição, for informado pelo ' + #13 +
              'usuário e for seguinte ao último ano cadastrado associado a ' + #13 +
              'contribuições.'         + #13 +
              #13 + #13 + 'Deseja realmente iniciar o processo?';

      if Application.MessageBox(pchar(sMsg),'Confirme',36) <> 6 then
      begin
         Exit;
      end;

      //Último ano com contribuições vinculadas
      iAnoUltimo := CtrlCadAssociacaoContribAno.RetornarUltimoAno();
      if (iAnoUltimo = 0) then
      begin
         Application.MessageBox(pchar('Não foi realizado nenhum vínculo de contribuições com algum ano.' + #13 +
                                      'Processo de replicagem não poderá prosseguir.'),'Atenção',48);
         Exit;
      end;

      //Próximo Ano
      iAnoSeguinte :=  iAnoUltimo + 1;

      //Verifica se o ano seguinte possui contribuições vinculadas
      cdsContrSel.Close;
      cdsContrSel.Data := CtrlCadAssociacaoContribAno.ListarContrAno(iAnoSeguinte);
      if (cdsContrSel.RecordCount > 0) then
      begin
         Application.MessageBox(pchar('O ano: '  + IntToStr(iAnoSeguinte) + ' já possuí contribuições relacioandas.' + #13 +
                                      'Processo de replicagem não poderá prosseguir.'),'Atenção',48);
         Exit;
      end;

      //Consulta contribuições do último ano
      cdsContrDisp.Data := CtrlCadAssociacaoContribAno.ListarContrAno(iAnoUltimo);

      //Insere para o Ano Seguinte todas as constribuições do ano selecionado.
      cdsContrDisp.First;
      TRY
         Screen.Cursor :=  crHourGlass;

         //Controles
         TrancaTela(true);
         TrancaBarra(false);
         Accept := CtrlCadAssociacaoContribAno.GravarContrAno(iAnoSeguinte,cdsContrDisp);

         if Accept then
            Application.MessageBox(pchar('Contribuições vinculados ao ano ' + IntToStr(iAnoSeguinte) + ' com sucesso.'),
                                           'Informação',48)
         else
            Application.MessageBox(pchar('Ocorreu um erro ao vincular contribuições ao ano ' + IntToStr(iAnoSeguinte)),'Informação',48);
      FINALLY
         Screen.Cursor :=  crDefault;
         TrancaTela(false);
         TrancaBarra(True);
      END;
   FINALLY
      cdsContrSel.Close;
      cdsContrDisp.CLose;
   END;
end;

procedure TFrmCadAssociacaoContribAno.TrancaBarra(cond: Boolean);
begin
     btnInserir.Enabled  := cond;
     btnProcurar.Enabled := cond;
     btnReplicar.Enabled := cond;
     Application.ProcessMessages;
end;

procedure TFrmCadAssociacaoContribAno.edtAnoEnter(Sender: TObject);
begin
     cdsContrDisp.CLose;
     lblContrDisp.Caption := 'Total: 0';
     cdsContrSel.CLose;
     lblContrSel.Caption  := 'Total: 0';
end;

procedure TFrmCadAssociacaoContribAno.edtAnoExit(Sender: TObject);
begin
     if Trim(edtAno.Text) = '' then
        edtAnoEnter(edtAno);
end;

procedure TFrmCadAssociacaoContribAno.edtAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     //ENTER
     if (Key = #13) then
      btnListar.Click();
end;

end.

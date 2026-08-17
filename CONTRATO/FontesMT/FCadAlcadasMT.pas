unit FCadAlcadasMT;
{ ------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Rotina......: frmCadAlcadasMT
Nº SOL......: 142171
Nº KINTANA..: 913629
Data........: 12/08/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Criação do formulário para cadastro de Alçadas.
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, Mask, wwdbedit,
  DBClient, uCMClientDataSet, uCtrlAlcadas, FCadastroMT, wwdbdatetimepicker,
  DBCtrls, TREdit;

type
Tstatus = (inserir,alterar, excluir, aguardar);

type
  TFrmCadAlcadasMT = class(TFrmCadastroMT)
    dsCargos: TwwDataSource;
    cdsCargos: TCMClientDataSet;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    dbLcCargo: TwwDBLookupCombo;
    dbDtInicioVigencia: TwwDBDateTimePicker;
    dbValor: TDBRadioGroup;
    dbEdValor: TDBRealEdit;
    dbckDE: TDBCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbckDEClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    CtrlAlcadas : TCtrlAlcadas;
    status : Tstatus;
    function verificaFilhos(sMensagemErro : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  FrmCadAlcadasMT: TFrmCadAlcadasMT;

implementation
uses dBaseDados, uMensErro, uSistema, uGeralContrato;
{$R *.DFM}

procedure TFrmCadAlcadasMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAlcadas := TCtrlAlcadas.Create;
  CtrlAlcadas.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          nil);
  cds.Data := CtrlAlcadas.listaAlcadas('-1');
  cdsCargos.Data := CtrlAlcadas.listaCargos();
  status := aguardar;
end;

procedure TFrmCadAlcadasMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //Procedimento para efetivar as alterações no Banco
  if not CtrlAlcadas.Gravar(cds) then
      if verificaFilhos(CtrlAlcadas.MessageInfo) then
      MsgDlg('Existem contratos associados a alçada a qual deseja excluir, favor verificar.','Erro',mtError,[mbOK],0)
      else
      MsgDlg(CtrlAlcadas.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadAlcadasMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  //Procedimento de Busca
  if MontaSelect.RetornouValor then
  cds.Data := CtrlAlcadas.listaAlcadas(MontaSelect.ValoresChave[0]);
end;



procedure TFrmCadAlcadasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  //Carrega o Usuário para o Cds.
  cds.FieldByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  cds.FieldByName('FLGLIMITE').asString := '<=';
  status := inserir;
end;

procedure TFrmCadAlcadasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
cMaiorAlcadaPeriodo, cMenorAlcadaPeriodo : Currency;
begin
  inherited;
  Accept := False;
  //Verifica se os Itens estão preenchidos
  if ((status = inserir) or (status = alterar)) then
  begin
      if (Trim(cds.FieldByName('IDCARGO').asString) = '') and not dbckDE.Checked  then
      begin
          MsgDlg('Obrigatório preencher o Cargo desta Alçada','Atenção',mtWarning,[mbOk],0);
          dbLcCargo.SetFocus;
          Exit;
      end;

      if ((dbValor.value <> '<=') and (dbValor.value <> '>')) then
      begin
        MsgDlg('Obrigatório preencher a condição desejada da Alçada','Atenção',mtWarning,[mbOk],0);
        dbValor.SetFocus;
        Exit;
      end;

      if (Trim(cds.FieldByName('VALOR').asString) = '') then
      begin
        MsgDlg('Obrigatório preencher o Valor da Alçada','Atenção',mtWarning,[mbOk],0);
        dbEdValor.SetFocus;
        Exit;
      end;

      if (Trim(cds.FieldByName('DTINICIOVIGENCIA').asString) = '') then
      begin
      MsgDlg('Obrigatório preencher a Data de Início da Vigência','Atenção',mtWarning,[mbOk],0);
      dbDtInicioVigencia.SetFocus;
      Exit;
      end;
  end;


      if ( (dbValor.Value = '>') and (
      ((status=inserir) and CtrlAlcadas.verificaAlcadaAcimaDe(DateToStr(dbDtInicioVigencia.DateTime))) or
      ((status=alterar) and CtrlAlcadas.verificaAlcadaAcimaDe(DateToStr(dbDtInicioVigencia.DateTime),cds.fieldByName('IDALCADAS').asString,true))
      ) )then
      begin
          MsgDlg('Não é permitido cadastrar duas alçadas com a condição "acima de" com a mesma data de vigência.','Atenção',mtWarning,[mbOk],0);
          dbValor.setFocus;
          Exit;
      end;

      if ( (dbValor.Value = '<=') and (
      ((status=inserir) and CtrlAlcadas.verificaAlcadaAte(DateToStr(dbDtInicioVigencia.DateTime),cds.FieldByName('IDCARGO').asString)) or
      ((status=alterar) and CtrlAlcadas.verificaAlcadaAte(DateToStr(dbDtInicioVigencia.DateTime),cds.FieldByName('IDCARGO').asString,cds.FieldByName('IDALCADAS').asString,true))
      )) then
      begin
          MsgDlg('Não é permitido cadastrar duas condições para o mesmo cargo com a mesma data de vigência.','Atenção',mtWarning,[mbOk],0);
          dbValor.setFocus;
          Exit;
      end;

  if ((status = inserir) or (status = alterar)) then
  begin
      cMenorAlcadaPeriodo :=  CtrlAlcadas.verificaValorLimite(dbDtInicioVigencia.DateTime);

      if (dbValor.Value = '<=') and (dbEdValor.Value > cMenorAlcadaPeriodo) and (CtrlAlcadas.verificaAlcadaAcimaDe(DateToStr(dbDtInicioVigencia.DateTime))) then
      begin
          MsgDlg('O valor de sua Alçada com Condição Até deve ser inferior ao valor da menor Alçada com Condição ACIMA DE para esta vigência.', 'Atenção',mtWarning,[mbOk],0);
          dbValor.setFocus;
          Exit;

      end;
      cMaiorAlcadaPeriodo :=  CtrlAlcadas.verificaValorMenor(dbDtInicioVigencia.DateTime);

        if (dbValor.Value = '>') and (dbEdValor.Value < cMaiorAlcadaPeriodo) and (CtrlAlcadas.verificaAlcadaAteGeral(DateToStr(dbDtInicioVigencia.DateTime))) then
      begin
          MsgDlg('O valor de sua Alçada com Condição ACIMA DE deve ser superior ao valor da maior Alçada com Condição ATÉ para esta vigência.', 'Atenção',mtWarning,[mbOk],0);
          dbValor.setFocus;
          Exit;
      end;
  end;

  Accept := True;
end;

procedure TFrmCadAlcadasMT.dbckDEClick(Sender: TObject);
begin
  inherited;
  if (dbckDE.Checked)then
  begin
      dbLcCargo.Enabled := false;
      //dbLcCargo.Clear;
      if cds.State in [dsEdit, dsInsert] then
      cds.FieldByName('IDCARGO').clear;
  end
  else
  dbLcCargo.Enabled := true;
end;

procedure TFrmCadAlcadasMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbckDE.Checked := false;
end;

function TFrmCadAlcadasMT.verificaFilhos(sMensagemErro: String): Boolean;
begin
    if Pos(UpperCase('Master has detail records'), UpperCase(sMensagemErro)) > 0 then
    result := true
    else
    result := false;
end;

procedure TFrmCadAlcadasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  status := aguardar;
end;

procedure TFrmCadAlcadasMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  status := aguardar;
end;



procedure TFrmCadAlcadasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  //Quando pressionado o botão alterar, os valores eram carregados com os valores inicias
  //quando o montaSelect foi executado pela primeira vez.
  if MontaSelect.RetornouValor then
  cds.Data := CtrlAlcadas.listaAlcadas(MontaSelect.ValoresChave[0]);
  status := alterar;
end;

procedure TFrmCadAlcadasMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  status := excluir;
end;

end.

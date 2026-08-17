unit FReajRubIndiv;

interface

{
--------------------------------------------------------------------------------
Pendência   : WO7104
Responsável : Leandro Pocebon
Data        : 18/01/2024
Descrição   : Ajuste seleç~so rubricas / inclusão colunas seleção, matricula e nome no grid.
Rotina      : 
--------------------------------------------------------------------------------
Pendência   : SIG 37809
Responsável : William Moreira da Silva
Data        : 20/01/2017
Descrição   : Não estava sendo realizado o ajuste para a rubrica.
Rotina      : bbtnProcessarClick
--------------------------------------------------------------------------------  }


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, TREdit,dBasedados,uAdmPrevFB,UmensErro, uSistema, uDataBase;

type
  TfrmReajRubIndiv = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    dblkpcmbRubDesconto: TwwDBLookupCombo;
    qryRubricasExistentes: TwwQuery;
    qryQuantitativos: TwwQuery;
    dsQuantitativos: TDataSource;
    dbgrDadosIniciais: TwwDBGrid;
    Label2: TLabel;
    pnlTotal: TPanel;
    rdgForma: TRadioGroup;
    rdgEscopo: TRadioGroup;
    GroupBox2: TGroupBox;
    lblForma: TLabel;
    redValor: TRealEdit;
    bbtnProcessar: TBitBtn;
    qryAux: TwwQuery;
    updQuantitativos: TUpdateSQL;
    qryQuantitativosSELECAO: TFloatField;
    qryQuantitativosMATRICULA: TStringField;
    qryQuantitativosNOME: TStringField;
    qryQuantitativosVALORRUBRICA: TFloatField;
    qryQuantitativosFLGPERMANENTE: TFloatField;
    qryQuantitativosFLGDESATIVADO: TFloatField;
    qryQuantitativosVALORANTERIOR: TFloatField;
    qryQuantitativosIDPESSOA: TFloatField;
    qryQuantitativosIDEMPRESA: TFloatField;
    qryQuantitativosIDRUBRICA: TFloatField;
    qryQuantitativosSEQRUBRICAINDIV: TFloatField;
    qryQuantitativosCOUNT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkpcmbRubDescontoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rdgFormaClick(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure LimpaCampos;
    procedure dblkpcmbRubDescontoExit(Sender: TObject);
    procedure rdgFormaExit(Sender: TObject);
    procedure rdgEscopoExit(Sender: TObject);
    procedure LiberaProcessamento;
    procedure redValorChange(Sender: TObject);
    procedure rdgEscopoClick(Sender: TObject);
    procedure dbgrDadosIniciaisDblClick(Sender: TObject);
  private
    { Private declarations }

    function ValidaSelecao : boolean;
  public
    { Public declarations }
  end;

var
  frmReajRubIndiv: TfrmReajRubIndiv;

implementation

{$R *.DFM}

procedure TfrmReajRubIndiv.FormShow(Sender: TObject);
begin
  inherited;
  Limpacampos;
  qryRubricasExistentes.close;
  //qryRubricasExistentes.parambyname('PIDFUNDACAO').asinteger:=iidFundacao; // leandro wo7104
  qryRubricasExistentes.Open;
end;

procedure TfrmreajRubIndiv.LimpaCampos;
begin
  pnlTotal.Caption    := '';
  rdgForma.ItemIndex  := -1;
  //rdgEscopo.ItemIndex := -1; //leandro wo7104
  rdgEscopo.ItemIndex := 1;    //leandro wo7104
  redValor.Value      := 0;
  bbtnProcessar.Enabled := false;
end;

procedure TfrmReajRubIndiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryRubricasExistentes.close;
  qryQuantitativos.close;
end;

procedure TfrmReajRubIndiv.dblkpcmbRubDescontoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  Limpacampos;
  QryQuantitativos.Close;
  qryQuantitativos.Parambyname('RUBRICA').asInteger:=
    qryRubricasExistentes.fieldbyname('IDPROVENTO').asInteger;
  //qryQuantitativos.parambyname('PIDFUNDACAO').asinteger:=iidFundacao; //leandro wo7104
  qryQuantitativos.Parambyname('PSELECAO').asInteger:= 0;  //leandro wo7104
  qryQuantitativos.open;
  pnlTotal.Caption:=IntToStr(qryQuantitativos.recordcount);
end;

procedure TfrmReajRubIndiv.rdgFormaClick(Sender: TObject);
begin
  inherited;
  If rdgForma.ItemIndex = 0 then
    lblForma.caption := 'Informe o Percentual para Reajuste'
  else
    lblForma.Caption := 'Informe o Valor para Reajuste';
end;

procedure TfrmReajRubIndiv.bbtnProcessarClick(Sender: TObject);
var ssql,sValor : String;
begin
  inherited;

  //leandro wo7104 - inicio
  if rdgForma.ItemIndex = -1 then
  begin
    MsgDlg('Selecione a forma de reajuste ',
           'Informação', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  If rdgEscopo.ItemIndex = 1 then
  begin
    if not ValidaSelecao then
    begin
      MsgDlg('Selecione ao menos uma rubrica para rocessamento ',
             'Informação', mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
  end;
  //leandro wo7104 - fim

  try
    sValor := FloatToStr(redValor.Value);
  except
    MsgDlg('O Valor / Percentual informado para o reajuste é inválido ',
           'Informação', mtInformation, [mbOk, mbHelp], 0);
    Limpacampos;
    exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Reajuste de Rubrica Individual.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  //leandro wo7104 - inicio

  If rdgEscopo.ItemIndex = 0 then
  begin
    qryAux.close;
    qryAux.sql.clear;
    ssql := 'UPDATE RUBRICAINDIV SET VALORANTERIOR = VALORRUBRICA, ';
    If rdgForma.ItemIndex  = 1 then
    begin
      svalor := Oranumero(FloatToStr(redValor.Value));
      ssql := ssql + ' VALORRUBRICA = '+ svalor;
    end
    else
    begin
      svalor := Oranumero(FloatToStr((redvalor.value/100)+1));
      ssql := ssql + ' VALORRUBRICA = ROUND(VALORRUBRICA * '+ svalor+',2)';
    end;

    ssql:=ssql+
      ' WHERE IDRUBRICA = '+
        InttoStr(qryRubricasExistentes.fieldbyname('IDPROVENTO').asInteger);

    ssql:=ssql+' AND IDEMPRESA = '+inttostr(iidFundacao)+' ';

    qryaux.SQL.Add(ssql);

    qryAux.execsql;
  end
  else
  begin
    qryQuantitativos.First;
    while not qryQuantitativos.eof do
    begin
      if qryQuantitativos.FieldByName('selecao').Value = 1 then
      begin
        qryAux.close;
        qryAux.sql.clear;
        ssql := 'UPDATE RUBRICAINDIV SET VALORANTERIOR = VALORRUBRICA, ';
        If rdgForma.ItemIndex  = 1 then
        begin
          svalor := Oranumero(FloatToStr(redValor.Value));
          ssql := ssql + ' VALORRUBRICA = '+ svalor;
        end
        else
        begin
          svalor := Oranumero(FloatToStr((redvalor.value/100)+1));
          ssql := ssql + ' VALORRUBRICA = ROUND(VALORRUBRICA * '+ svalor+',2)';
        end;

        ssql:=ssql+ ' WHERE IDRUBRICA = '+ InttoStr(qryRubricasExistentes.fieldbyname('IDPROVENTO').asInteger);

        ssql:=ssql+ ' AND VALORRUBRICA = ' + Oranumero(qryQuantitativos.fieldbyname('VALORRUBRICA').asstring);

        if(qryQuantitativos.fieldbyname('VALORANTERIOR').AsString = '') then
        begin
          ssql:= ssql + ' AND VALORANTERIOR IS NULL ';
        end
        else
        begin
           ssql:= ssql + ' AND VALORANTERIOR = '+
           Oranumero(qryQuantitativos.fieldbyname('VALORANTERIOR').asstring);
        end;

        ssql := ssql + ' AND FLGPERMANENTE = '+
        Inttostr(qryQuantitativos.fieldbyname('FLGPERMANENTE').asInteger)+
        ' AND FLGDESATIVADO = '+
        Inttostr(qryQuantitativos.fieldbyname('FLGDESATIVADO').asInteger);

        ssql:=ssql+' AND IDEMPRESA = '+inttostr(iidFundacao)+' ';

        ssql:=ssql+ ' AND IDPESSOA = ' + IntToStr(qryQuantitativos.fieldbyname('IDPESSOA').asInteger);
        ssql:=ssql+ ' AND SEQRUBRICAINDIV = ' + IntToStr(qryQuantitativos.fieldbyname('SEQRUBRICAINDIV').asInteger);

        qryaux.SQL.Add(ssql);

        qryAux.execsql;
      end;

      qryQuantitativos.Next;
    end;
  end;
  //leandro wo7104 - fim

  dtmBaseDados.dbBaseDados.Commit;

  LimpaCampos;
  qryQuantitativos.Close;
  qryQuantitativos.Open;
end;

procedure TfrmReajRubIndiv.dblkpcmbRubDescontoExit(Sender: TObject);
begin
  inherited;
  LiberaProcessamento;
end;

procedure TfrmReajRubIndiv.rdgFormaExit(Sender: TObject);
begin
  inherited;
  LiberaProcessamento;
end;

procedure TfrmReajRubIndiv.rdgEscopoExit(Sender: TObject);
begin
  inherited;
  LiberaProcessamento;
end;

procedure TfrmReajRubIndiv.LiberaProcessamento;
begin
  If ((dblkpcmbRubDesconto.Text <> '') and
     (rdgForma.ItemIndex >= 0)    and
     (rdgEscopo.ItemIndex >= 0)   and
     (redValor.Value > 0)) then
    bbtnProcessar.Enabled:=true
  else
    bbtnProcessar.enabled:=false;
end;

procedure TfrmReajRubIndiv.redValorChange(Sender: TObject);
begin
  inherited;
  LiberaProcessamento;
end;

procedure TfrmReajRubIndiv.rdgEscopoClick(Sender: TObject);
begin
  inherited;
  //leandro WO7104 - inicio    
  if rdgEscopo.ItemIndex = 0 then
  begin
    if qryQuantitativos.Active then
    begin
      QryQuantitativos.Close;
      qryQuantitativos.Parambyname('RUBRICA').asInteger:= qryRubricasExistentes.fieldbyname('IDPROVENTO').asInteger;
      qryQuantitativos.Parambyname('PSELECAO').asInteger:= 1;
      qryQuantitativos.open;
    end;
  end
  else
  begin
    if qryQuantitativos.Active then
    begin
      QryQuantitativos.Close;
      qryQuantitativos.Parambyname('RUBRICA').asInteger:= qryRubricasExistentes.fieldbyname('IDPROVENTO').asInteger;
      qryQuantitativos.Parambyname('PSELECAO').asInteger:= 0;
      qryQuantitativos.open;
    end;
  end;
  //leandro WO7104 - fim
end;

procedure TfrmReajRubIndiv.dbgrDadosIniciaisDblClick(Sender: TObject);
begin
  inherited;
  //leandro WO7104 - inicio
  if rdgEscopo.ItemIndex = 1 then
  begin
    qryQuantitativos.Edit();
    if qryQuantitativos.FieldByName('selecao').Value = 1 then
      qryQuantitativos.FieldByName('selecao').Value := 0
    else
      qryQuantitativos.FieldByName('selecao').Value := 1;
    qryQuantitativos.Post;
    qryQuantitativos.Next;
  end;
  //leandro WO7104 - fim
end;

function TfrmReajRubIndiv.ValidaSelecao : boolean;
begin
  //leandro WO7104 - inicio
  result := false;

  qryQuantitativos.First;
  while not qryQuantitativos.eof do
  begin
    if qryQuantitativos.FieldByName('selecao').Value = 1 then
    begin
      result := true;
      break;
    end;

    qryQuantitativos.next;
  end;

  qryQuantitativos.first;
  //leandro WO7104 - fim
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FREAJRUBINDIV                                                          |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA PARA FAZER O REAJUSTE DE VALORES DA RUBRICA INDIVIDUAL.               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2003 A 18/07/2003                         |
| PENDÊNCIA: 14601                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}


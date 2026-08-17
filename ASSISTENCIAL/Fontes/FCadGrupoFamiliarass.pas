unit FCadGrupoFamiliarass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadGrupoFamiliarass = class(TfrmCadastroCS)
    Label1: TLabel;
    DBCodigo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblkcmbTitular: TwwDBLookupCombo;
    dblkcmbResponsavel: TwwDBLookupCombo;
    qryTitular: TwwQuery;
    dsTitular: TwwDataSource;
    qryResponsavel: TwwQuery;
    qryTitularIDPESSOA: TFloatField;
    qryTitularINSCRICAONUMERO: TFloatField;
    qryTitularTITULAR: TStringField;
    qryAux: TwwQuery;
    qryIDNUCLEO: TFloatField;
    qryIDTITULAR: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkcmbTitularChange(Sender: TObject);
    procedure dblkcmbTitularCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkcmbResponsavelCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sSql, sPessoa, sResponsavel: string;
  public
    { Public declarations }
  end;

var
  FrmCadGrupoFamiliarass: TFrmCadGrupoFamiliarass;
  Cod: integer;

implementation

uses UMensErro, UDataBase, DBaseDados, fInserePart;

{$R *.DFM}

procedure TFrmCadGrupoFamiliarass.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State in [dsinsert] then begin
    Cod := LeUltRegistro(nil,'NUCLEOFAMASS');
    qryIDNUCLEO.AsInteger := Cod;
  end;
  inherited;
end;

procedure TFrmCadGrupoFamiliarass.CmeCadastroInsert(Sender: TObject);
begin
  qry.Close;
  qryTitular.Open;
  qryResponsavel.Open;
  qry.ParamByName('IDTITULAR').AsInteger := -1;
  qry.Open;
  inherited;
end;

procedure TFrmCadGrupoFamiliarass.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    qry.Close;
    qryTitular.Close;
    qryTitular.Open;
    qryResponsavel.Close;
    qryResponsavel.sql.text :=  '  SELECT '+
                                '  DT.IDPESSOA,  '+
                                '  DT.IDTITULAR, '+
                                '  DP.DESCRICAO, '+
                                '  PR.NOME AS RESPONSAVEL '+
                                ' FROM                    '+
                                '  DEPENTIT DT,           '+
                                '  PESSOA   PR,           '+
                                '  DEPEN    DP            '+
                                ' WHERE                   '+
                                '      (DT.IDPESSOA = PR.IDPESSOA) '+
                                '  AND (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA) '+
                                '  AND (DT.IDTITULAR <> DT.IDPESSOA)         '+
                                '  AND DT.IDTITULAR = '+ MontaSelect.ValoresChave[0];


    qryResponsavel.Open;
    qry.ParamByName('IDTITULAR').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qry.Open;
//***
   if qryTitular.Locate('IDPESSOA', qry.fieldByName('IDTITULAR').asString, [loCaseInsensitive,loPartialKey]) then
   begin
     dblkcmbTitular.text        := qryTitular.FieldByName('TITULAR').asString;
     dblkcmbTitular.lookupvalue := qryTitular.FieldByName('IDPESSOA').asString;
   end;

   if qryResponsavel.Locate('IDTITULAR', qry.fieldByName('IDTITULAR').asString, [loCaseInsensitive,loPartialKey]) then
   begin
     dblkcmbResponsavel.text        := qryResponsavel.FieldByName('RESPONSAVEL').asString;
     dblkcmbResponsavel.lookupvalue := qryResponsavel.FieldByName('IDPESSOA').asString;
   end;

//***
  end;
end;

procedure TFrmCadGrupoFamiliarass.bbtnConfirmarClick(Sender: TObject);
  var  Operacao: TDataSetState;
begin
  Operacao := ds.DataSet.State;
  if Operacao <> dsBrowse then begin
    if dblkcmbTitular.Text = '' then begin
      MsgDlg('É preciso escolher o Titular !', 'Erro', mtError, [mbOk,mbHelp], 0);
      dblkcmbTitular.SetFocus;
      Exit;
    end;
    if dblkcmbResponsavel.Text = '' then begin
      MsgDlg('É necessário definir o Responsável do Grupo Familiar !', 'Erro', mtError, [mbOk,mbHelp], 0);
      dblkcmbResponsavel.SetFocus;
      Exit;
    end;
  end; {if Dataset dsBrowse}
  sPessoa      := qry.FieldByName('IDTITULAR').AsString;
  sResponsavel := qry.FieldByName('IDRESPONSAVEL').AsString;
  try
    inherited;
  except
    bbtnCancelarClick(Sender);
    Exit;
  end; {try .. except}
  if (Operacao = dsInsert) or (Operacao = dsEdit) then begin
    sSql := 'BEGIN NULL;';
    if Operacao = dsInsert then begin
      sSql := sSql + ' UPDATE PARTASS SET IDNUCLEO = ' + IntToStr(Cod) +
                     ' WHERE (IDPESSOA = '+ sPessoa + ');';
    end; {if Insert}
    sSql := sSql + ' UPDATE CONTASS SET IDPAGADOR = ' + sResponsavel +
                   ' WHERE (IDTITULAR = '+ sPessoa + ')' +
                   ' AND ( (IDPAGADOR <> 1) OR (IDPAGADOR <> 99) );';
    sSql := sSql + ' UPDATE BENEFASS SET RESPONSAVELPAG = 0' +
                   ' WHERE (IDTITULAR    = ' + sPessoa + ');';
    sSql := sSql + ' UPDATE BENEFASS SET RESPONSAVELPAG = 1' +
                   ' WHERE (IDTITULAR    = ' + sPessoa + ')' +
                   '   AND (IDDEPENDENTE = ' + sResponsavel + ');';
    sSql := sSql + ' END;';
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSql);
    try
      qryAux.ExecSQL;
    except
      on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
      end; {on}
    end; {try .. except}
  end; {if Dataset dsInsert}
end;

procedure TFrmCadGrupoFamiliarass.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   dblkcmbTitular.SetFocus;
end;

procedure TFrmCadGrupoFamiliarass.sbtnApagarClick(Sender: TObject);
var sSql, sPessoa: string;
begin
  sPessoa := qry.FieldByName('IDTITULAR').AsString;
  sSql := 'BEGIN NULL;';
  sSql := sSql + ' UPDATE PARTASS SET IDNUCLEO = NULL' +
                 ' WHERE (IDPESSOA = '+ sPessoa + ');';
  sSql := sSql + ' UPDATE CONTASS SET IDPAGADOR = ' + sPessoa +
                 ' WHERE (IDTITULAR = '+ sPessoa + ')' +
                 ' AND (IDPAGADOR <> 1);';
  sSql := sSql + ' END;';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  try
    qryAux.ExecSQL;
    inherited;
  except
    on E: EDBEngineError do begin
      MostrarErro(E);
      Exit;
    end; {on}
  end; {try .. except}
end;

procedure TFrmCadGrupoFamiliarass.bbtnSairClick(Sender: TObject);
begin
  If FormGrpFamAberto then
   If FrmInserePart.WindowState=wsMinimized
     Then FrmInserePart.WindowState:=wsNormal;
  inherited;
end;

procedure TFrmCadGrupoFamiliarass.dblkcmbTitularChange(Sender: TObject);
begin
  inherited;
  (* Limpa Pensionista *)
  dblkcmbResponsavel.Clear;
end;

procedure TFrmCadGrupoFamiliarass.dblkcmbTitularCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryResponsavel.Close;
  qryResponsavel.sql.text :=  ' SELECT  '+
                              '   DT.IDPESSOA,  '+
                              '   DT.IDTITULAR, '+
                              '   DP.DESCRICAO, '+
                              '   PR.NOME AS RESPONSAVEL '+
                              ' FROM                     '+
                              '   DEPENTIT DT,           '+
                              '   PESSOA   PR,           '+
                              '   DEPEN    DP            '+
                              '   WHERE                  '+
                              '   (DT.IDPESSOA = PR.IDPESSOA) '+
                              '   AND (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA) '+
                              '   AND (DT.IDTITULAR <> DT.IDPESSOA)         '+
                              '   AND DT.IDTITULAR = '+ intToStr(strToIntDef(dblkcmbTitular.LookupValue, -1));
   qryResponsavel.Open;

  qry.FieldByName('IDTITULAR').AsString     := qryResponsavel.fieldByName('IDTITULAR').asString;
  qry.FieldByName('IDRESPONSAVEL').AsString := qryResponsavel.fieldByName('IDPESSOA').asString;

end;

procedure TFrmCadGrupoFamiliarass.dblkcmbResponsavelCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qry.FieldByName('IDRESPONSAVEL').AsString := dblkcmbResponsavel.LookupValue;
end;

end.

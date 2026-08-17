unit FRelPlanos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, wwdblook, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, Menus, FOkCancelar, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmPlanAssist = class(TfrmOkCancelar)
    Panel4: TPanel;
    Panel5: TPanel;
    p: TLabel;
    Label10: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    Label1: TLabel;
    qryprev: TwwQuery;
    dsprev: TwwDataSource;
    dsassist: TwwDataSource;
    dsrel: TwwDataSource;
    qryrel: TwwQuery;
    qryassist: TwwQuery;
    qryAux: TwwQuery;
    DBLookupListrel: TDBLookupListBox;
    DBGrid1: TDBGrid;
    qrypessjur: TwwQuery;
    dspessjur: TwwDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    dblkplistPlanoAss: TDBLookupListBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    PopupMenu1: TPopupMenu;
    Ativo1: TMenuItem;
    spbverde: TSpeedButton;
    spbvermelho: TSpeedButton;
    qrycontribass: TwwQuery;
    Detalhes1: TMenuItem;
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure dblkplistPlanoAssMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistPlanRelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dblkplistPlanRelDragOver(Sender, Source: TObject; X, Y: Integer;
              State: TDragState; var Accept: Boolean);
    procedure dblkplistPlanRelMouseDown(Sender: TObject;
              Button : TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistPlanoAssDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dblkplistPlanoAssDragOver(Sender, Source: TObject; X, Y: Integer;
              State: TDragState; var Accept: Boolean);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryassistBeforeOpen(DataSet: TDataSet);
    procedure qryrelBeforeOpen(DataSet: TDataSet);
    procedure qryprevAfterScroll(DataSet: TDataSet);
    procedure wwDBLookupCombo1Enter(Sender: TObject);
    procedure wwDBLookupCombo1Change(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure dblkplistPlanoAssEnter(Sender: TObject);
    procedure DBLookupListrelEnter(Sender: TObject);
    procedure wwDBLookupCombo1Exit(Sender: TObject);
    procedure dblkplistPlanoAssClick(Sender: TObject);
    procedure DBLookupListrelClick(Sender: TObject);
    procedure Ativo1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure qryrelAfterScroll(DataSet: TDataSet);
    procedure spbverdeClick(Sender: TObject);
    procedure spbvermelhoClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Detalhes1Click(Sender: TObject);
  private
    { Private declarations }
  public
  insere : boolean;
  unidnegoc : integer;
  codcentrocustod, codcentrocustoc, placontac, placontad : string;
  TipCodigo, Codcentrorespon : String;
  Codsubconta, alteradorjuros, alteradorcorrecao : Integer;
    { Public declarations }
  end;

var
  idplanass, idplanoprev, idpessjur : String;
  frmPlanAssist: TfrmPlanAssist;
  Detalhe, Saiu : Boolean;
implementation

uses UMensErro, FNumInsc, UAdmAss;

{$R *.DFM}

procedure TfrmPlanAssist.FormCreate(Sender: TObject);
begin
  inherited;
  qrypessjur.close;    qrypessjur.open;
  wwDBLookupCombo1.text := qrypessjur.FieldByName('nome').AsString;
  qryprev.close;       qryprev.open;
  qryassist.Close;     qryassist.Open;
  qryrel.Close;        qryrel.Open;
end;

procedure TfrmPlanAssist.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;

  if wwDBLookupCombo1.text ='' then
    exit;
  if qryrel.isempty then
    exit;
  if qryprev.isempty then
    exit ;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDPESSOA'+
                  ' FROM PARTASS'+
                 ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IdPlanoPrev').AsString+') '+
                   ' AND (IDPLANASS ='+qryrel.FieldByName('IdPlanass').AsString+') '+
                   ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+') '+
                   ' AND (RowNum = 1)');
  try
     qryAux.open;
  except
     on E: EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
  if not qryAux.isempty then
  begin
     showmessage('O relacionamento não pode ser apagado por ter Participantes ligados a ele !!');
     exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDTITULAR'+
                  ' FROM BENEFASS'+
                 ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IdPlanoPrev').AsString+')'+
                   ' AND (IDPLANASS ='+qryrel.FieldByName('IdPlanass').AsString+')'+
                   ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')'+
                   ' AND (RowNum = 1)');
  try
     qryAux.open;
  except
     on E: EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
  if not qryAux.isempty then
  begin
     showmessage('O relacionamento não pode ser apagado por ter beneficiários ligados a ele !!');
     exit;
  end;

  //apaga integração de contribuições por patrocinadora
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE CONTRIBPLANPREVA '+
                 ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IdPlanoPrev').AsString+')'+
                   ' AND (IDPLANASS ='+qryrel.FieldByName('IdPlanass').AsString+')'+
                   ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
  try
     qryAux.ExecSQL;
  except
  end;

  //apaga DATAS por patrocinadora
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE DATASPATROPLANASS '+
                 ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IdPlanoPrev').AsString+')'+
                   ' AND (IDPLANASS ='+qryrel.FieldByName('IdPlanass').AsString+')'+
                   ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
  try
     qryAux.ExecSQL;
  except
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE PLANPREVASS '+
                 ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IdPlanoPrev').AsString+')'+
		   ' AND (IDPLANASS ='+qryrel.FieldByName('IdPlanass').AsString+')'+
                   ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
  try
     qryAux.ExecSQL;
     // qryaux.CommitUpdates;
  except
     showmessage('O relacionamento não pode ser apagado.');
     Exit;
  end;

  qryrel.Close;
  qryrel.Open;
  qryassist.Close;
  qryassist.Open;
end;

procedure TfrmPlanAssist.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  if wwDBLookupCombo1.text ='' then
    exit;

  if qryassist.isempty then
    exit;

  if qryprev.isempty then
    exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('INSERT INTO PLANPREVASS(IDPLANOPREV,IDPLANASS,IDPESSJUR,FLGATIVO,FLGAUTONUMINSC)'+
     'VALUES('+qryprev.FieldByName('IDPLANOPREV').AsString+','+
             ''+qryassist.FieldByName('IDPLANASS').AsString+','+
             ''+qrypessjur.FieldByName('IDPESSOA').AsString+',1,0)');
  try
    Saiu := false;
    qryAux.ExecSQL;

    AbrirFormModal(frmNumInsc, TfrmNumInsc);
    frmNumInsc.free;
    if Saiu then
    begin
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add
         ('DELETE PLANPREVASS'+
          ' WHERE (IDPLANOPREV = '+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
            ' AND (IDPLANASS = '+qryassist.FieldByName('IDPLANASS').AsString+')'+
            ' AND (IDPESSJUR = '+qrypessjur.FieldByName('IDPESSOA').AsString+')');
       try
          qryaux.execsql;
       except
       end;
       exit;
    end;

    idPlanAss :=  qryAssist.FieldByName('IDPLANASS').AsString;
    idPlanoPrev := qryPrev.FieldByName('IDPLANOPREV').AsString;
    idPessJur := qryPessJur.FieldByName('IDPESSOA').AsString;

    qryContribAss.close;
    qryContribAss.ParamByName('IDPLANASS').Value := IdPlanAss;
    qryContribAss.open;
    qryContribAss.first;

    while not qryContribAss.eof do
    begin
      //atualiza tabela de integração contábil ao nível de contribuição
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add
        ('INSERT INTO CONTRIBPLANPREVA(IDPLANASS,IDPLANOPREV,IDPESSJUR,IDCONTASS)'+
        ' VALUES('+idplanass+','+idplanoprev+','+idpessjur+','+
          qrycontribass.FieldByName('idcontass').AsString+')');
      try
         qryaux.execsql;
      except
      end;
      qryContribAss.next;
    end;

    insere := true;

  except
    on E: EDBEngineError do
    begin
      MostrarErro(E);
      exit;
    end;
  end;

  qryRel.Close;
  qryRel.Open;
  qryAssist.Close;
  qryAssist.Open;
end;

procedure TfrmPlanAssist.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;

  if wwDBLookupCombo1.text = '' then
    exit;
  if qryrel.isempty then
    exit;
  if qryprev.isempty then
    exit ;

  qryrel.first;
  while not qryrel.eof do
  begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT IDPESSOA'+
                     ' FROM PARTASS '+
                    ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.open;
     except
     end;
     if not qryaux.isempty then
     begin
        qryrel.next;
        continue;
     end;

     //apaga integração de contribuições por patrocinadora
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('DELETE CONTRIBPLANPREVA '+
                    ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.ExecSQL;
     except
     end;

     //apaga DATAS por patrocinadora
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('DELETE DATASPATROPLANASS '+
                    ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.ExecSQL;
     except
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('DELETE PLANPREVASS '+
                    ' WHERE (IDPLANOPREV = '+qryPrev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS = '+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPESSJUR = '+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.ExecSQL;
     except
        raise;
     end;
     qryrel.next;
  end;//while

  qryrel.Close;     qryrel.Open;
  qryassist.Close;   qryassist.Open;
  if not qryrel.isempty then
     showmessage('Alguns relacionamentos não podem ser apagados por terem participantes ligados a eles');
end;

procedure TfrmPlanAssist.dblkplistPlanoAssMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
    TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmPlanAssist.dblkplistPlanRelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
    TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmPlanAssist.dblkplistPlanRelDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;

  if qryAssist.isEmpty then
    exit;

  if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox) then
  begin
     TDBLookUpListBox(Source).EndDrag(True);
     //Se o drag não vier da lista de planos Assistênciais, cancelar
     if not (TDBLookUpListBox(Source).Name = 'dblkplistPlanoAss') then
       exit;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('INSERT INTO PLANPREVASS(IDPLANOPREV,IDPLANASS,IDPESSJUR,FLGATIVO) '+
                    'VALUES ('+qryprev.FieldByName('IDPLANOPREV').AsString+','+
                            qryAssist.FieldByName('IDPLANASS').AsString+','+
                            qryPessJur.FieldByName('IDPESSOA').AsString+',1)');
     try

        Saiu := false;
        qryAux.ExecSQL;

        AbrirFormModal(frmNumInsc, TfrmNumInsc);
        frmNumInsc.free;
        if Saiu then
        begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add('DELETE PLANPREVASS'+
                          ' WHERE (IDPLANOPREV = '+qryPrev.FieldByName('IDPLANOPREV').AsString+')'+
                            ' AND (IDPLANASS = '+qryAssist.FieldByName('IDPLANASS').AsString+')'+
                            ' AND (IDPESSJUR = '+qryPessJur.FieldByName('IDPESSOA').AsString+')');
           try
              qryAux.execsql;
           except
           end;

           exit;
        end;

        idPlanAss := qryAssist.FieldByName('IDPLANASS').AsString;
        idPlanoPrev := qryPrev.FieldByName('IDPLANOPREV').AsString;
        idPessJur := qryPessJur.FieldByName('IDPESSOA').AsString;

        qryContribAss.close;
        qryContribAss.ParamByName('IDPLANASS').Value := IdPlanass;
        qryContribAss.open;
        qryContribAss.first;

        while not qryContribAss.eof do
        begin
           //atualiza tabela de integração contábil ao nível de contribuição
           qryaux.close;
           qryaux.sql.clear;
           qryAux.sql.add('INSERT INTO  CONTRIBPLANPREVA(IDPLANASS,IDPLANOPREV,IDPESSJUR,IDCONTASS)'+
                         ' VALUES('+idPlanAss+','+idPlanoPrev+','+idPessJur+','+qryContribAss.FieldByName('IDCONTASS').AsString+')');
           try
              qryAux.execsql;
           except
           end;
           qryContribAss.next;
        end;

        insere := true;

     except
        on E: EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     qryrel.Close;
     qryrel.Open;
     qryassist.Close;
     qryassist.Open;
  end;
end;

procedure TfrmPlanAssist.dblkplistPlanRelDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmPlanAssist.dblkplistPlanoAssDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  if qryrel.isempty then
    exit;

  if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox) then
  begin
     TDBLookUpListBox(Source).EndDrag(True);
     //Se o drag não vier da lista de Relação, cancelar
     if not (TDBLookUpListBox(Source).Name = ('DBLookupListrel')) then
       exit;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT IDPESSOA'+
                    ' FROM PARTASS '+
                   ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                     ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                     ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.open;
     except
        on E: EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
     if not qryAux.isempty then
     begin
        showmessage('O relacionamento não pode ser apagado por ter Participantes ligados a ele !!');
        exit;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT IDTITULAR'+
                    ' FROM BENEFASS'+
                   ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                     ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                     ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.open;
     except
        on E: EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
     if not qryAux.isempty then
     begin
        showmessage('O relacionamento não pode ser apagado por ter beneficiários ligados a ele !!');
        exit;
     end;

     //apaga integração de contribuições por patrocinadora
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('DELETE CONTRIBPLANPREVA '+
                    ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPESSJUR ='+qrypessjur.FieldByName('IDPESSOA').AsString+')');
     try
        qryAux.ExecSQL;
     except
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('DELETE PLANPREVASS '+
                    ' WHERE (IDPLANOPREV ='+qryprev.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')');
     try
        qryAux.ExecSQL;
        //qryaux.CommitUpdates;
     except
        showmessage('O relacionamento não pode ser apagado.');
        Exit;
     end;

     qryrel.Close;
     qryrel.Open;
     qryassist.Close;
     qryassist.Open;
  end;
end;

procedure TfrmPlanAssist.dblkplistPlanoAssDragOver(Sender,
          Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmPlanAssist.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;

  if wwDBLookupCombo1.text = '' then
    exit;
  if qryAssist.isempty then
    exit;
  if qryPrev.isempty then
    exit ;

  qryAssist.first;
  while not  qryAssist.eof do
  begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('INSERT INTO PLANPREVASS(IDPLANOPREV,IDPLANASS,IDPESSJUR,FLGATIVO) '+
                    'VALUES ('+qryprev.FieldByName('IDPLANOPREV').AsString+','+
                             qryassist.FieldByName('IDPLANASS').AsString+','+
                             qrypessjur.FieldByName('IDPESSOA').AsString+',1)');
     try
        Saiu := false;
        qryAux.ExecSQL;

        AbrirFormModal(frmNumInsc, TfrmNumInsc);
        frmNumInsc.free;
        if Saiu then
        begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add('DELETE PLANPREVASS'+
                          ' WHERE (IDPLANOPREV = '+qryPrev.FieldByName('IDPLANOPREV').AsString+')'+
                          ' AND (IDPLANASS = '+qryAssist.FieldByName('IDPLANASS').AsString+')'+
                          ' AND (IDPESSJUR = '+qryPessJur.FieldByName('IDPESSOA').AsString+')');
           try
              qryAux.execsql;
           except
           end;
           exit;
        end;

        idPlanAss := qryAssist.FieldByName('IDPLANASS').AsString;
        idPlanoPrev := qryPrev.FieldByName('IDPLANOPREV').AsString;
        idPessJur := qryPessJur.FieldByName('IDPESSOA').AsString;

        qryContribAss.close;
        qryContribAss.ParamByName('IDPLANASS').Value := IdPlanAss;
        qryContribAss.open;
        qryContribAss.first;

        while not qryContribAss.eof do
        begin
           //atualiza tabela de integração contábil ao nível de contribuição
           qryAux.close;
           qryAux.sql.clear;
           qryAux.sql.add('INSERT INTO  CONTRIBPLANPREVA(IDPLANASS,IDPLANOPREV,IDPESSJUR,IDCONTASS)'+
                         ' VALUES('+idPlanAss+','+idPlanoPrev+','+idPessJur+','+qryContribAss.FieldByName('IDCONTASS').AsString+')');
           try
              qryAux.execsql;
           except
           end;
           qryContribAss.next;
        end;

        insere := true;

     except
       raise;
     end;
     qryassist.next;
  end;//while
  qryRel.Close;
  qryRel.Open;
  qryAssist.Close;
  qryAssist.Open;
end;

procedure TfrmPlanAssist.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if qrypessjur.active then
    wwDBLookupCombo1.text := qrypessjur.FieldByName('NOME').AsString;
  qryrel.Close;
  qryrel.open;
  qryassist.close;
  qryassist.open;
end;

procedure TfrmPlanAssist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := cafree;
end;

procedure TfrmPlanAssist.qryassistBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryassist.ParamByName('IDPLANOPREV').Value := qryprev.FieldByName('IDPLANOPREV').AsInteger;
  qryassist.ParamByName('IDPESSJUR').Value := qrypessjur.FieldByName('IDPESSOA').AsInteger;
end;

procedure TfrmPlanAssist.qryrelBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryrel.ParamByName('IDPLANOPREV').Value := qryprev.FieldByName('IDPLANOPREV').AsInteger;
  qryrel.ParamByName('IDPESSJUR').Value := qrypessjur.FieldByName('IDPESSOA').AsInteger;
end;

procedure TfrmPlanAssist.qryprevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryrel.Close;
  qryrel.open;
  qryassist.close;
  qryassist.open;
end;

procedure TfrmPlanAssist.wwDBLookupCombo1Enter(Sender: TObject);
begin
  inherited;
  qryprev.close;   qryprev.open;
  qryassist.Close; qryassist.Open;
  qryrel.Close;    qryrel.Open;

  if not qryrel.isempty then
  begin
     if qryrel.FieldByName('FLGATIVO').AsInteger = 1 then
     begin
        spbverde.enabled := true;
        spbvermelho.enabled := false;
     end
     else
     begin
        spbvermelho.enabled := true;
        spbverde.enabled := false;
     end;
  end
  else
  begin
     spbverde.enabled := false;
     spbvermelho.enabled := false;
  end;
end;

procedure TfrmPlanAssist.wwDBLookupCombo1Change(Sender: TObject);
begin
  inherited;
  if wwDBLookupCombo1.text = '' then
    wwDBLookupCombo1.setfocus ;
end;

procedure TfrmPlanAssist.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  if not  qryprev.Active then
    exit;
  if wwDBLookupCombo1.text ='' then
    wwDBLookupCombo1.setfocus ;
end;

procedure TfrmPlanAssist.dblkplistPlanoAssEnter(Sender: TObject);
begin
  inherited;
  if not  qryassist.Active then
    exit;
  if wwDBLookupCombo1.text ='' then
    wwDBLookupCombo1.setfocus ;
  if (qryprev.active) and
     (qryprev.isempty) then
    wwDBLookupCombo1.setfocus ;
end;

procedure TfrmPlanAssist.DBLookupListrelEnter(Sender: TObject);
begin
  inherited;
  if not qryrel.Active then
    exit;

  if wwDBLookupCombo1.text = '' then
    wwDBLookupCombo1.SetFocus;

  if (qryprev.active) and
     (qryprev.isempty) then
    wwDBLookupCombo1.SetFocus ;
end;

procedure TfrmPlanAssist.wwDBLookupCombo1Exit(Sender: TObject);
begin
  inherited;
  wwDBLookupCombo1.text := qrypessjur.FieldByName('NOME').AsString;
end;

procedure TfrmPlanAssist.dblkplistPlanoAssClick(Sender: TObject);
begin
  inherited;
  if qrypessjur.active then
    wwDBLookupCombo1.text := qrypessjur.FieldByName('NOME').AsString;
end;

procedure TfrmPlanAssist.DBLookupListrelClick(Sender: TObject);
begin
  inherited;
  if qryPessJur.active then
    wwDBLookupCombo1.text := qryPessJur.FieldByName('NOME').AsString ;
end;

procedure TfrmPlanAssist.Ativo1Click(Sender: TObject);
begin
  inherited;

  if ativo1.Checked then
  begin
     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add('UPDATE PLANPREVASS'+
                      ' SET FLGATIVO = 0'+
                    ' WHERE (IDPLANASS = '+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPLANOPREV ='+qryrel.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPESSJUR ='+qryrel.FieldByName('IDPESSJUR').AsString+')');
     qryaux.execsql;
     //qryaux.CommitUpdates;
  end
  else
  begin
     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add('UPDATE PLANPREVASS'+
                      ' SET FLGATIVO = 1'+
                    ' WHERE (IDPLANASS = '+qryrel.FieldByName('IDPLANASS').AsString+')'+
                      ' AND (IDPLANOPREV = '+qryrel.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND (IDPESSJUR ='+qryrel.FieldByName('IDPESSJUR').AsString+')');
     qryaux.execsql;
     // qryaux.CommitUpdates;
  end;
end;

procedure TfrmPlanAssist.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  ativo1.checked := (qryrel.FieldByName('FLGATIVO').AsInteger = 1);
end;

procedure TfrmPlanAssist.qryrelAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not qryrel.isempty then
  begin
     if qryrel.FieldByName('flgativo').AsInteger = 1 then
     begin
        spbverde.enabled := true ;
        spbvermelho.enabled := false;
     end
     else
     begin
        spbvermelho.enabled := true;
        spbverde.enabled := false ;
     end;
  end
  else
  begin
        spbvermelho.enabled := false;
        spbverde.enabled := false ;
  end;
end;

procedure TfrmPlanAssist.spbverdeClick(Sender: TObject);
begin
  inherited;
  if spbverde.Enabled then
  begin
         qryAux.close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('UPDATE PLANPREVASS'+
                          ' SET FLGATIVO = 0 '+
                        ' WHERE (IDPLANOPREV ='+qryrel.FieldByName('IDPLANOPREV').AsString+')'+
                          ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                          ' AND (IDPESSJUR ='+qryrel.FieldByName('IDPESSJUR').AsString+')');
         try
           qryAux.execsql;
           qryrel.close;
           qryrel.open;
         except
           raise;
         end;
  end;
end;

procedure TfrmPlanAssist.spbvermelhoClick(Sender: TObject);
begin
  inherited;
  if spbvermelho.enabled then
  begin
    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE PLANPREVASS'+
                     ' SET FLGATIVO = 1 '+
                   ' WHERE (IDPLANOPREV ='+qryrel.FieldByName('IDPLANOPREV').AsString+')'+
                     ' AND (IDPLANASS ='+qryrel.FieldByName('IDPLANASS').AsString+')'+
                     ' AND (IDPESSJUR ='+qryrel.FieldByName('IDPESSJUR').AsString+')');
    try
      qryAux.execsql;
      qryrel.close;
      qryrel.open;
    except
      raise;
    end;{try}
  end;
end;

procedure TfrmPlanAssist.bbtnSairClick(Sender: TObject);
begin
  //inherited;
  close;
end;

procedure TfrmPlanAssist.FormActivate(Sender: TObject);
begin
  inherited;
  Detalhe := false;
  sbtnAssocia.enabled := true;
  sbtnAssociaTodos.enabled := true;
  sbtnDesassocia.enabled := true;
  sbtnDesassociaTodos.enabled := true;
end;

procedure TfrmPlanAssist.Detalhes1Click(Sender: TObject);
begin
  inherited;
  Detalhe := true;
  AbrirFormModal(frmnuminsc,Tfrmnuminsc);
  frmnuminsc.free;
  Detalhe := false;
end;

end.

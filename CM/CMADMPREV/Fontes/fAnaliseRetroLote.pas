unit fAnaliseRetroLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Wwquery, Db, Wwtable, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TfrmAnaliseRetroLote = class(TfrmSairAjuda)
    bbtnImprimir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    lblArquivoPatro: TLabel;
    edTxt: TEdit;
    spArquivoTexto: TSpeedButton;
    odTxt: TOpenDialog;
    bbtnAnalisar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Panel2: TPanel;
    pnEstat: TPanel;
    pn3: TPanel;
    lbDecorrido: TLabel;
    Label9: TLabel;
    pn2: TPanel;
    Label6: TLabel;
    pn1: TPanel;
    Label8: TLabel;
    redResult: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    lbRubNao: TLabel;
    lbRubSim: TLabel;
    lbPessNao: TLabel;
    lbPessEleg: TLabel;
    lbPessPart: TLabel;
    procedure spArquivoTextoClick(Sender: TObject);
    procedure bbtnVisaoClick(Sender: TObject);
    procedure bbtnAnalisarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnLoadClick(Sender: TObject);
  private
    { Private declarations }
    tflog : textfile;
    horaini : tdatetime;
    ltotal, lrubsim, lrubnao, lpessnada, lpesseleg, lpesspart : longint;
  public
    { Public declarations }
    procedure Mostra(Msg : string; tela : boolean);
    procedure AtualizaAmbiente(bqual : boolean);
  end;

var
  frmAnaliseRetroLote: TfrmAnaliseRetroLote;

implementation

{$R *.DFM}

uses UMensErro, dRetroativoLote;

procedure TfrmAnaliseRetroLote.Mostra(Msg : string; tela : boolean);
begin
  if tela then
  begin
    try
      redResult.lines.add(msg);
    except
      redResult.lines.clear;
      redResult.lines.add(msg);
    end;
    redresult.update;
  end;
  writeln(tflog,msg);
end;

procedure TfrmAnaliseRetroLote.AtualizaAmbiente(bqual : boolean);
 var delta : tdatetime;
begin
  delta:=now-horaini;
  lbDecorrido.caption:=formatdatetime('hh:nn:ss', delta);
  lbDecorrido.update;
  if bqual then
  begin
    lbRubNao.caption:=inttostr(lrubnao);
    lbRubNao.update;
    lbRubSim.caption:=inttostr(lrubsim);
    lbRubSim.update;
  end
  else
  begin
    lbPessNao.caption:=inttostr(lpessnada);
    lbPessNao.update;
    lbPessEleg.caption:=inttostr(lpesseleg);
    lbPessEleg.update;
    lbPessPart.caption:=inttostr(lpesspart);
    lbPessPart.update;
  end;
  inc(ltotal);
  if ltotal div 100 = 0 then application.processmessages;
end;

procedure TfrmAnaliseRetroLote.spArquivoTextoClick(Sender: TObject);
begin
  inherited;
  if odTxt.Execute then
   edTxt.Text := odTxt.FileName;
end;

procedure TfrmAnaliseRetroLote.bbtnVisaoClick(Sender: TObject);
begin
  inherited;
  dmRetroativoLote.tbParadox.open;
  redResult.visible:=false;
end;

procedure TfrmAnaliseRetroLote.bbtnAnalisarClick(Sender: TObject);
const numpess = 6;
var saux, sname, sexten, srubrica, smatricula : string;
    bprob : boolean;
    imostra : byte;

 function GeraArquivoSchema: Boolean;
 begin

   Result := True;
   try
    with TStringList.Create do
    begin
      Add('[' + Copy(ExtractFileName(Trim(edTxt.Text)), 1, Length(ExtractFileName(Trim(edTxt.Text))) - 4) + ']');
      Add('Filetype=Fixed');
      Add('CharSet=ascii');
      Add('Field1=MATRICULA,Char,8,00,0'+ #13 + #10);
      Add('Field2=MES,Char,6,00,8'+ #13 + #10);
      Add('Field3=RUBRICA,Char,7,00,14'+ #13 + #10);
      Add('Field4=VALOR,Char,12,00,21'+ #13 + #10);
      //Salvando o arquivo de Schema(*.sch);
      SaveToFile(Copy(edTxt.Text, 1, Length(edTxt.Text) - 4) + '.sch');
    end;
    except
      Result := False;
   end;
 end;

begin
  inherited;
  horaini:=now;
  ltotal:=0; lrubsim:=0; lrubnao:=0; lpessnada:=0; lpesseleg:=0; lpesspart:=0;
  pnEstat.visible:=true;
  bbtnSair.enabled:=false;
  bbtnAnalisar.enabled:=false;
  bprob:=false;
  with dmRetroativoLote do
  begin
    try
      sname:=Trim(edTxt.Text);
      if sname = '' then
      begin
        MsgDlg('Atenção! O arquivo da Patrocinadora deve ser especificado.', 'Erro', mtError, [mbOk], 0);
        edTxt.SetFocus;
        Exit;
      end;

      if not FileExists(sname) then
      begin
        MsgDlg('Atenção! O arquivo da Patrocinadora não existe.', 'Erro', mtError, [mbOk], 0);
        edTxt.SetFocus;
        Exit;
      end;

      //Setando o nome do arquivo e o caminho como "TableName" e "DataBaseName" respectivamente;
      if tbTxt.Active then
        tbTxt.Close;

      tbTxt.DatabaseName:=ExtractFilePath(sname);
      sname:=ExtractFileName(sname);
      tbTxt.TableName:=sname;

      sexten:=ExtractFileExt(sname);
      tbParadox.TableName:=copy(sname,1,length(sname)-length(sexten));
      tbParadox.DatabaseName:=tbTxt.DatabaseName;

      tbPessoa.DatabaseName:=tbTxt.DatabaseName;
      try
        tbPessoa.open;
        while not tbPessoa.eof do
          tbPessoa.delete;
        tbPessoa.close;
      except
        tbPessoa.CreateTable;
        tbPessoa.AddIndex('', 'Matricula', [ixPrimary]);
      end;
      tbPessoa.open;

      tbRubrica.DatabaseName:=tbTxt.DatabaseName;
      try
        tbRubrica.open;
        while not tbRubrica.eof do
          tbRubrica.delete;
        tbRubrica.close;
      except
        tbRubrica.CreateTable;
        tbrubrica.AddIndex('', 'Codprov', [ixPrimary]);
      end;
      tbRubrica.open;

      try
        assignfile(tflog,tbParadox.DatabaseName+tbParadox.TableName+'_anal.log');
        rewrite(tflog);
      except
        MsgDlg('Atenção! Problema na criação do arquivo de log.', 'Erro', mtError, [mbOk], 0);
        Exit;
      end;

      //Criando o arquivo de Schema(*.sch);
      Screen.Cursor:=crHourGlass;
      if not GeraArquivoSchema then
      begin
        MsgDlg('Atenção! Não foi possível criar o arquivo "' + Copy(edTxt.Text, 1, Length(edTxt.Text) - 4) + '.sch' + '". Este arquivo é necessário para que o Recebimento seja efetuado. ', 'Erro',
               mtError, [mbOk], 0);
        Screen.Cursor := crDefault;
        Exit;
      end;

      Mostra('PREPARO DO RETROATIVO EM LOTE', false);
      Mostra('ARQUIVO DA PATROCINADORA : '+Trim(edTxt.text), false);

      Application.ProcessMessages;
      tbTxt.Open;
      Mostra(TimeToStr(Time)+' - Iniciando a criação do arquivo temporário', true);
      Application.ProcessMessages;
      bmPatro.Execute;
      tbTxt.Close;
      Mostra(TimeToStr(Time)+' - Término da criação do arquivo temporário', true);

      qryAnalise.databasename:=tbTxt.DatabaseName;

      Application.ProcessMessages;
      Mostra(TimeToStr(Time)+' - Iniciando a análise de rubricas', true);
      qryAnalise.close;
      qryAnalise.sql.clear;
      qryAnalise.sql.add('select distinct rubrica from '+tbParadox.TableName);
      qryAnalise.open;

      qryRubrica.close;
      qryRubrica.prepare;
      qryRubrica.params.parambyname('IDPESSJUR').asfloat:=99;

      Mostra('+---------+------+--------+-------+--------+', true);
      Mostra('| Rubrica | Cad. |Desconto|SalPart|SalBenef|', true);
      Mostra('+---------+------+--------+-------+--------+', true);
      while not qryAnalise.eof do
      begin
        qryRubrica.close;
        srubrica:=trim(qryAnalise.fieldbyname('rubrica').asstring);
        qryRubrica.params.parambyname('CODPROVDESC').asstring:=srubrica;
        qryRubrica.open;
        saux:='| '+qryAnalise.fieldbyname('rubrica').asstring+' |';
        if qryRubrica.isempty then
        begin
          saux:=saux+' Não  |        |       |        |';
          inc(lrubnao);
        end
        else
        begin
          saux:=saux+' Sim  |';
          if qryRubrica.fieldbyname('FLGDESCONTO').asinteger = 1  then
            saux:=saux+'   D    |'
          else
            saux:=saux+'   C    |';
          if qryRubrica.fieldbyname('FLGSALPARTRETRO').ISNULL then
            saux:=saux+'       |'
          else
            if qryRubrica.fieldbyname('FLGSALPARTRETRO').asinteger = 1 then
              saux:=saux+'   x   |'
            else
              saux:=saux+'       |';
          if qryRubrica.fieldbyname('FLGSALBENEFRETRO').isnull then
            saux:=saux+'        |'
          else
            if qryRubrica.fieldbyname('FLGSALBENEFRETRO').asinteger = 1 then
              saux:=saux+'   x    |'
            else
              saux:=saux+'        |';
          try
            tbRubrica.append;
            tbRubrica.fieldbyname('CODPROV').asstring:=qryAnalise.fieldbyname('rubrica').asstring;
            tbRubrica.fieldbyname('IDRUBRICA').asfloat:=qryRubrica.fieldbyname('IDPROVENTO').asfloat;
            tbRubrica.fieldbyname('FLGDESCONTO').asinteger:=qryRubrica.fieldbyname('FLGDESCONTO').asinteger;
            tbRubrica.fieldbyname('FLGSALPART').asinteger:=qryRubrica.fieldbyname('FLGSALPARTRETRO').asinteger;
            tbRubrica.fieldbyname('FLGSALBENEF').asinteger:=qryRubrica.fieldbyname('FLGSALBENEFRETRO').asinteger;
            tbRubrica.post;
          except
          end;
          inc(lrubsim);
        end;
        Mostra(saux, true);
        qryAnalise.next;
        AtualizaAmbiente(true);
      end;
      Mostra('+---------+------+--------+-------+--------+', true);
      Mostra(TimeToStr(Time)+' - Término da análise de rubricas', true);

      Application.ProcessMessages;
      Mostra(TimeToStr(Time)+' - Iniciando a análise das pessoas', true);
      qryAnalise.close;
      qryAnalise.sql.clear;
      qryAnalise.sql.add('select distinct matricula from '+tbParadox.TableName);
      qryAnalise.open;

      qryElegivel.close;
      qryElegivel.prepare;
      qryParticipa.close;
      qryParticipa.prepare;

      Mostra('+---------+------+---------+------+---------+------+---------+------+---------+------+---------+------+', true);
      Mostra('|Matricula| Cad. |Matricula|Estado|Matricula|Estado|Matricula|Estado|Matricula|Estado|Matricula|Estado|', true);
      Mostra('+---------+------+---------+------+---------+------+---------+------+---------+------+---------+------+', true);
      imostra:=0; saux:='';
      while not qryAnalise.eof do
      begin
        inc(imostra);
        qryElegivel.close;
        smatricula:=trim(qryAnalise.fieldbyname('matricula').asstring);
        qryElegivel.params.parambyname('IDMATRICULA').asstring:=smatricula;
        qryElegivel.open;
        saux:=saux+'|'+qryAnalise.fieldbyname('matricula').asstring+' |';
        if qryElegivel.isempty then
        begin
          saux:=saux+' Nada ';
          inc(lpessnada);
        end
        else
        begin
          qryParticipa.close;
          qryParticipa.params.parambyname('IDPESSOA').asfloat:=qryElegivel.fieldbyname('IDPESSOA').asfloat;
          qryParticipa.params.parambyname('IDPESSJUR').asfloat:=qryElegivel.fieldbyname('IDPESSJUR').asfloat;
          qryParticipa.open;
          if qryParticipa.isempty then
          begin
            saux:=saux+' Eleg ';
            inc(lpesseleg);
          end
          else
          begin
            saux:=saux+' Part ';
            try
              tbPessoa.append;
              tbPessoa.fieldbyname('MATRICULA').asstring:=qryAnalise.fieldbyname('matricula').asstring;
              tbPessoa.fieldbyname('IDPESSJUR').asfloat:=qryParticipa.fieldbyname('IDPESSJUR').asfloat;
              tbPessoa.fieldbyname('IDPESSOA').asfloat:=qryParticipa.fieldbyname('IDPESSOA').asfloat;
              tbPessoa.fieldbyname('IDPLANOPREV').asfloat:=qryParticipa.fieldbyname('IDPLANOPREV').asfloat;
              tbPessoa.fieldbyname('IDSALPART').asfloat:=qryParticipa.fieldbyname('IDRUBSALPARTICIP').asfloat;
              tbPessoa.fieldbyname('IDSALBENEF').asfloat:=qryParticipa.fieldbyname('IDRUBSALBENEFICIO').asfloat;
              tbPessoa.post;
            except
            end;
            inc(lpesspart);
          end;
        end;
        if imostra = numpess then
        begin
          Mostra(saux+'|', true);
          saux:='';
          imostra:=0;
        end;
        qryAnalise.next;
        AtualizaAmbiente(false);
      end;
      while length(saux) < 17*numpess do
        saux:=saux+'|         |      ';
      if saux <> '' then
        Mostra(saux+'|', true);
      Mostra('+---------+------+---------+------+---------+------+---------+------+---------+------+---------+------+', true);
      Mostra(TimeToStr(Time)+' - Término da análise das pessoas', true);
      Mostra('', true);
      Mostra('Lista dos Participantes', true);
      Mostra('+-----------+', true);
      Mostra('| Matrícula |', true);
      Mostra('+-----------+', true);
      tbpessoa.first;
      while not tbpessoa.eof do
      begin
        Mostra('| '+tbPessoa.fieldbyname('MATRICULA').asstring+'  |', true);
        tbpessoa.next;
      end;
      Mostra('+-----------+', true);
      Mostra('', true);
      Mostra('-------------------------------------------------------------------------------------------------------', true);
      Mostra('Sumário', true);
      Mostra('-------------------------------------------------------------------------------------------------------', true);
      Mostra('Tempo total: '+lbDecorrido.caption, true);
      Mostra('-------------------------------------------------------------------------------------------------------', true);
      Mostra('Total de rubricas analisadas: '+inttostr(lrubnao+lrubsim), true);
      Mostra('Quantidade de rubricas salariais cadastradas: '+inttostr(lrubsim), true);
      Mostra('Quantidade de rubricas salariais não cadastradas: '+inttostr(lrubnao), true);
      Mostra('-------------------------------------------------------------------------------------------------------', true);
      Mostra('Total de pessoas analisadas: '+inttostr(lpessnada+lpesseleg+lpesspart), true);
      Mostra('Quantidade de pessoas participantes: '+inttostr(lpesspart), true);
      Mostra('Quantidade de pessoas elegíveis: '+inttostr(lpesseleg), true);
      Mostra('Quantidade de pessoas não cadastradas: '+inttostr(lpessnada), true);
      Mostra('-------------------------------------------------------------------------------------------------------', true);
      bprob:=true;
    finally
      closefile(tflog);
      tbPessoa.close;
      tbRubrica.close;
      tbTxt.Close;
      tbParadox.close;
      qryAnalise.close;
      qryRubrica.close;
      qryElegivel.close;
      qryParticipa.close;
      bbtnSair.enabled:=true;
      bbtnImprimir.enabled:=true;
      bbtnAnalisar.enabled:=not bprob;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmAnaliseRetroLote.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  redResult.Print('Análise retroativo em lote');
end;

procedure TfrmAnaliseRetroLote.bbtnLoadClick(Sender: TObject);
begin
  inherited;
  redResult.lines.loadfromfile(Trim(edTxt.Text));
end;

end.

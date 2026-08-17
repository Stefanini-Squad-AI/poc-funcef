// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

unit fExportaDicDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwtable,
  ExtDlgs, ZipMstr, ComCtrls, uSistema;

type
  TfrmExportaDicDados = class(TfrmOkCancelar)
    QryCmpBd: TwwQuery;
    bmCmpBd: TBatchMove;
    TbCmpBd: TwwTable;
    QryCmpBdGrp: TwwQuery;
    bmCMPBDGRP: TBatchMove;
    TbCmpBdGrp: TwwTable;
    QryGrpArquivo: TwwQuery;
    bmGrpArquivo: TBatchMove;
    TbGrpArquivo: TwwTable;
    ZipMaster1: TZipMaster;
    Panel1: TPanel;
    rgOpcao: TRadioGroup;
    re: TRichEdit;
    sd: TSaveDialog;
    od: TOpenDialog;
    QryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportaDicDados: TfrmExportaDicDados;

implementation

uses fAguarde, uDatabase, uMensErro;

{$R *.DFM}

procedure TfrmExportaDicDados.bbtnConfirmarClick(Sender: TObject);
var
   vSql : String;
begin
  inherited;
  Case rgOpcao.ItemIndex of
       0 : begin //Exportação
                 frmAguarde.Mostra('Exportando Dicionário de Dados...');
                 frmAguarde.Refresh;

                  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332 - 27/02/2009
                 //if fileexists('temp\cmpbd.db') then
                 if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then

                    //DeleteFile('c:\temp\cmpbd.db');
                    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

                 //if fileexists('c:\temp\cmpbdgrp.db') then
                 if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then

                    //DeleteFile('c:\temp\cmpbdgrp.db');
                    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

                 //if fileexists('c:\temp\grparquivo.db') then
                 if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

                    //DeleteFile('c:\temp\grparquivo.db');
                    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

                 QryCmpBd.Close;
                 QryCmpBd.Open;
                 TbCmpBd.Close;
                 bmCmpBd.Execute;

                 QryCmpBdGrp.Close;
                 QryCmpBdGrp.Open;
                 TbCmpBdGrp.Close;
                 bmCMPBDGRP.Execute;

                 QryGrpArquivo.Close;
                 QryGrpArquivo.Open;
                 TbGrpArquivo.Close;
                 bmGrpArquivo.Execute;
                 frmAguarde.Apaga;
                 Sd.Execute;
                 if Sd.FileName <> '' then begin
                    frmAguarde.Mostra('Compactando Dados ...');
                    ZipMaster1.zipfilename:=Sd.FileName;
                    //Jéssica Lana SOL 109421 KINTANA 496332
                    //ZipMaster1.FSpecArgs.Add('C:\Temp\CMPBD.db');
                    ZipMaster1.FSpecArgs.Add(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBD.db');
                    //ZipMaster1.FSpecArgs.Add('C:\Temp\CMPBDGRP.db');
                    ZipMaster1.FSpecArgs.Add(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBDGRP.db');
                    //ZipMaster1.FSpecArgs.Add('C:\Temp\GRPARQUIVO.db');
                    ZipMaster1.FSpecArgs.Add(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPARQUIVO.db');
                    ZipMaster1.AddOptions:=[AddMove];
                    ZipMaster1.Add;
                    frmAguarde.Apaga;
                 end;
           end;
       1 : begin //Importação
                 od.Execute;
                 if Od.FileName <> '' then begin
                    StartTransacao;

                    frmAguarde.Mostra('Descompactando Dados ...');
                    frmAguarde.Refresh;

                    //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');

                     //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
                    //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
                    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

                    //DeleteFile('c:\temp\grparquivo.db');
                      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

                    ZipMaster1.ZipFilename := Od.FileName;

                    //ZipMaster1.ExtrBaseDir := 'c:\temp';
                    ZipMaster1.ExtrBaseDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

                    ZipMaster1.Extract;

                    frmAguarde.Mostra('Importando Grupos de Arquivos ...');
                    frmAguarde.Refresh;

                    TbGrpArquivo.Open;
                    TbCmpBd.Open;
                    TbCmpBdGrp.Open;

                    frmAguarde.Max := TbGrpArquivo.RecordCount + TbCmpBdGrp.RecordCount + TbCmpBd.RecordCount;
                    frmAguarde.Pos := 0;
                    frmAguarde.Min := 0;

                    QryGrpArquivo.Open;

                    re.Lines.Add('STATUS DE IMPORTAÇÃO DE DICIONÁRIO DE DADOS');
                    re.Lines.Add('');
                    re.Lines.Add('');
                    re.Lines.Add('Grupos de Arquivos');
                    re.Lines.Add('');
                    while not TbGrpArquivo.Eof do begin
                          if not QryGrpArquivo.Locate('CODGRUPOARQUIVO', TbGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString,[]) then begin
                             with QryAux do begin
                                  Close;
                                  Sql.Clear;
                                  vSql := 'INSERT INTO GRPARQUIVO (CODGRUPOARQUIVO, DESCGRUPOARQUIVO,SETORGRUPOS) VALUES ('''+
                                          TbGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString+''','''+
                                          TbGrpArquivo.FieldbyName('DESCGRUPOARQUIVO').AsString+''','''+
                                          TbGrpArquivo.FieldbyName('SETORGRUPOS').AsString+''')';
                                  Sql.Add(vSql);
                                  try
                                     ExecSql;
                                  except
                                        re.Lines.Add('   Erro de Inserção em CODGRUPOARQUIVO : '+TbGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString);
                                  end;
                             end;
                          end;
                          TbGrpArquivo.Next;
                          frmAguarde.Pos := frmAguarde.Pos + 1;
                    end;

                    frmAguarde.Mostra('Importando Grupo de Dicionário ...');
                    frmAguarde.Refresh;
                    re.Lines.Add('');
                    re.Lines.Add('');
                    re.Lines.Add('Grupos de Dicionário de Dados');
                    re.Lines.Add('');
                    QryCmpBdGrp.Open;
                    while not TbCmpBdGrp.Eof do begin
                          if not QryCmpBdGrp.Locate('CODGRUPOARQUIVO;IDCAMPO', varArrayOf([TbCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString,
                                 TbCmpBdGrp.FieldbyName('IDCAMPO').AsString]),[]) then begin
                             with QryAux do begin
                                  Close;
                                  Sql.Clear;
                                  vSql := 'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES ('''+
                                          TbCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString+''','''+
                                          TbCmpBdGrp.FieldbyName('IDCAMPO').AsString+''')';
                                  Sql.Add(vSql);
                                  try
                                     ExecSql;
                                  except
                                        re.Lines.Add( '   Erro de Inserção em CODGRUPOARQUIVO : '+TbCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString+
                                                      '  IDCAMPO : '+TbCmpBdGrp.FieldbyName('IDCAMPO').AsString);
                                  end;
                             end;
                          end;
                          TbCmpBdGrp.Next;
                          frmAguarde.Pos := frmAguarde.Pos + 1;
                    end;

                    frmAguarde.Mostra('Importando Dicionário de Dados...');
                    frmAguarde.Refresh;

                    re.Lines.Add('');
                    re.Lines.Add('');
                    re.Lines.Add('Dicionário de Dados');
                    re.Lines.Add('');
                    QryCmpBd.Open;
                    while not TbCmpBd.Eof do begin
                          if not QryCmpBd.Locate('IDCAMPO', TbCmpBd.FieldbyName('IDCAMPO').AsString,[]) then begin
                             with QryAux do begin
                                  Close;
                                  Sql.Clear;
                                  vSql := 'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, '+
                                          'CAMPODOBANCO, CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO) VALUES ('''+
                                          TbCmpBd.FieldbyName('IDCAMPO').AsString+''','''+
                                          TbCmpBd.FieldbyName('ENTIDADE').AsString+''','''+
                                          TbCmpBd.FieldbyName('NOMEDOCAMPO').AsString+''','''+
                                          TbCmpBd.FieldbyName('DESCRICAODOCAMPO').AsString+''','+
                                          TbCmpBd.FieldbyName('CAMPODOBANCO').AsString+','+
                                          TbCmpBd.FieldbyName('CHAVE').AsString+','+
                                          TbCmpBd.FieldbyName('FLGOBRIGATORIO').AsString+','''+
                                          TbCmpBd.FieldbyName('APELIDO').AsString+''','+
                                          TbCmpBd.FieldbyName('IDTIPODADO').AsString+')';
                                  Sql.Add(vSql);
                                  try
                                     ExecSql;
                                  except
                                        re.Lines.Add('   Erro de Inserção em IDCAMPO : '+TbCmpBd.FieldbyName('IDCAMPO').AsString);
                                  end;
                             end;
                          end;
                          TbCmpBd.Next;
                          frmAguarde.Pos := frmAguarde.Pos + 1;
                    end;

                    tbCmpBd.Close;

                    //Jéssica Lana SOL 109421 KINTANA 496332
                    //if fileexists('c:\temp\cmpbd.db') then
                      if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then

                       //DeleteFile('c:\temp\cmpbd.db');
                       DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

                    tbCmpBdGrp.Close;
                    //if fileexists('c:\temp\cmpbdgrp.db') then
                      if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then

                       //DeleteFile('c:\temp\cmpbdgrp.db');
                       DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

                    tbGrpArquivo.Close;
                    //if fileexists('c:\temp\grparquivo.db') then
                      if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

                       //DeleteFile('c:\temp\grparquivo.db');
                         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

                    frmAguarde.Apaga;

                    if MsgDlg('Confirma Gravação de Dados ?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
                       frmAguarde.Mostra('Finalizando operação ...');
                       frmAguarde.Refresh;
                       { Grava Log da operação}
                       If Not Sistema.GravaLogOperacoes('Importação/Exportação do Dicionario de Dados ') Then
                         Raise Exception.Create('Não Consegui Gravar o Log');
                       CommitTransacao;
                       frmAguarde.Apaga;
                    end else begin
                        frmAguarde.Mostra('Cancelando operação ...');
                        frmAguarde.Refresh;
                        RollBackTransacao;
                        frmAguarde.Apaga;
                    end;
                 end else
                     Exit;
           end;
  End;
end;

procedure TfrmExportaDicDados.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  RollBackTransacao;
end;

procedure TfrmExportaDicDados.FormCreate(Sender: TObject);
begin
  inherited;
    //Jéssica Lana SOL 109421 KINTANA 496332
    sd.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
